class Api::UsersController < ApplicationController
  before_action :authenticate_and_set_user
  before_action :check_user_role
  before_action :find_user

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    
    else
      render json: @user, status: :ok
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
    render json: @user, status: :ok
  end

  protected

  def check_user_role
    unless (@current_user.manager_user? or @current_user.admin?)
      render json: { errors: "Can't access this API call with your role" }
    end
  end

  private

  def find_user
    @user = User.where(id: params[:id]).first
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
