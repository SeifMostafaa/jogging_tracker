class Api::JoggingTimesController < ApplicationController
  include Sift

  before_action :authenticate_and_set_user

  # adding sift gem additionally
  filter_on :date, type: :date

  def index
    @jogging_times = filtrate(JoggingTime.all)

    # filtering jogging times from-to
    if params[:start_date].present? and params[:end_date].present?
      @jogging_times = @jogging_times.where("date >= '#{params[:start_date]}' AND date <= '#{params[:end_date]}'")
    end

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
