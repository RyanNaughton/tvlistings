class Station < ActiveRecord::Base

  has_many :schedules
  has_many :programs, :through => :schedules

end
