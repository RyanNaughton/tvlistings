class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :uniqueID
      t.string :title
      t.string :subtitle
      t.string :description
      t.string :showType
      t.string :seriesID
      t.date :originalAirDate

      t.timestamps
    end
  end
end
