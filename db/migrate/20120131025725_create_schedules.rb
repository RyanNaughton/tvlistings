class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :program
      t.integer :station
      t.string :time
      t.string :duration

      t.timestamps
    end
  end
end
