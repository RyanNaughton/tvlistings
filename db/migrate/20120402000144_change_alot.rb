class ChangeAlot < ActiveRecord::Migration
  def change
   rename_column :schedules, :program, :program_unique_id
    rename_column :schedules, :station, :station_unique_id 
  end

end
