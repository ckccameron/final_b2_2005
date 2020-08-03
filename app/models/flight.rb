class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  validates_presence_of :number, :date, :time, :departure_city, :arrival_city

  def count_minors
    passengers.where(age: 0...18).count
  end

  def count_adults
    passengers.where(age: 18..Float::INFINITY).count
  end
end
