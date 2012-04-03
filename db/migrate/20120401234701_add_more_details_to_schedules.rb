class AddMoreDetailsToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :program_id, :integer
    add_column :schedules, :station_id, :integer
  end
end
