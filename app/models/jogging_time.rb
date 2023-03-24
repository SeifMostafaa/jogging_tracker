class JoggingTime < ApplicationRecord
  validates :date, presence: true
  validates :distance, presence: true
  validates :time, presence: true
end
