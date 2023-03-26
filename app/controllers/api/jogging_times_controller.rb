class Api::JoggingTimesController < ApplicationController
  include Sift

  before_action :authenticate_and_set_user
  before_action :check_user_role
  before_action :set_jogging_time, only: [:show, :update,:destory] 

  # adding sift gem additionally
  filter_on :date, type: :date

  def index
    if @current_user.admin?
      @jogging_times = filtrate(JoggingTime.all)
    else
      @jogging_times = filtrate(current_user.jogging_times)
    end

    # filtering jogging times from-to
    if params[:start_date].present? and params[:end_date].present?
      @jogging_times = @jogging_times.where("date >= '#{params[:start_date]}' AND date <= '#{params[:end_date]}'")
    end

    render :index
  end

  def show
    render :show
  end

  def update
    if @jogging_time.update(jogging_time_params)
      render :show
    else
      respond_to do |format|
        format.json { render json: @jogging_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @jogging_time.destroy
    render :show
  end

  def weekly_report
    values = JoggingTime.get_weekly_report(current_user)
    render json: { average_speed: values[0] / values[1], 
                   average_distance: values[0],
                   current_week_started_at: values[2],
                   current_week_ends_at: values[3]  }
  end

  protected

  def check_user_role
    unless (@current_user.normal_user? or @current_user.admin?)
      render json: { errors: "Can't access this API call with your role" }
    end
  end

  def set_jogging_time
    if @current_user.admin?
      @jogging_time = JoggingTime.where(id: params[:id].to_i).first
    else
      @jogging_time = JoggingTime.where(id: params[:id].to_i, user_id: current_user.id).first
    end
  end

  private

  def jogging_time_params
    params.require(:jogging_time).permit(:date, :distance, :time)
  end
end
