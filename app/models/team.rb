class Team < ApplicationRecord

  has_many :drivers

  validates_presence_of :name
  validates :championships_won, presence: true
  validates :currently_leading, inclusion: [true, false]

  def self.order_by_time_created
    order(created_at: :desc)
  end

  def count_of_drivers
    drivers.count
  end


end
