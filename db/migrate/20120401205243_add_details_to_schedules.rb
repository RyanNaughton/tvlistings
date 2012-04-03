class AddDetailsToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :show_time, :datetime
    change_column :schedules, :duration, :integer
    remove_column :schedules, :time
  end
end
