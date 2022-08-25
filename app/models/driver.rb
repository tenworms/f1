class Driver < ApplicationRecord

  belongs_to :team

  validates_presence_of :name
  validates_presence_of :drivers_age
  validates :up_for_hire, inclusion: [true, false]



end
