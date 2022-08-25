class Team < ApplicationRecord

  has_many :drivers

  validates_presence_of :name
  validates :championships_won, presence: true
  validates :currently_leading, inclusion: [true, false]



end
