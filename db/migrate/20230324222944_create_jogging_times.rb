class CreateJoggingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :jogging_times do |t|
      t.date :date
      t.float :distance
      t.float :time

      t.timestamps
    end
  end
end
