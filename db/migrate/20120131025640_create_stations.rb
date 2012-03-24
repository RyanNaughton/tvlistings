class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :uniqueID
      t.string :name
      t.integer :fcc
      t.string :affiliate

      t.timestamps
    end
  end
end
