class JoggingTime < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :distance, presence: true
  validates :time, presence: true

  def self.get_weekly_report(user)
    week_begin = Date.today.beginning_of_week.strftime
    week_end = Date.today.end_of_week.strftime

    values = user.jogging_times
                         .where(created_at: Date.today.beginning_of_week.beginning_of_day..Date.today.end_of_week.end_of_day)
                         .pluck('avg(distance), avg(time)')
    values << week_begin
    values << week_end
    return values.flatten
  end
end
