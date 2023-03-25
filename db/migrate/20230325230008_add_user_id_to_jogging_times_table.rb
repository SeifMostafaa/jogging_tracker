class AddUserIdToJoggingTimesTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :jogging_times, :user, index: true
  end
end
