class Api::JoggingTimesController < ApplicationController
  before_action :authenticate_and_set_user

  def index
    @jogging_times = JoggingTime.all
    render :index
  end

  def show
    @jogging_time = JoggingTime.where(id: params[:id].to_i).first
    render :show
  end

  def update
    @jogging_time = JoggingTime.where(id: params[:id].to_i).first

    if @jogging_time.update(jogging_time_params)
      render :show
    else
      respond_to do |format|
        format.json { render json: @jogging_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @jogging_time = JoggingTime.where(id: params[:id].to_i).first
    @jogging_time.destroy
    render :show
  end

  private

  def jogging_time_params
    params.require(:jogging_time).permit(:date, :distance, :time)
  end

end