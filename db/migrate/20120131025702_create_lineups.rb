class CreateLineups < ActiveRecord::Migration
  def change
    create_table :lineups do |t|
      t.integer :station_id
      t.integer :channel
      t.integer :channelMinor

      t.timestamps
    end
  end
end
