class Program < ActiveRecord::Base

  has_many :schedules
  has_many :stations, :through => :schedules

  searchable do
    text :title, :boost => 5
    text :subtitle, :description
  end

end
