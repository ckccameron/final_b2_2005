require 'rails_helper'

RSpec.describe Flight do
  describe "relationships" do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "methods" do
    it "#count_minors" do
      southwest = Airline.create!(name: "Southwest")

      flight = Flight.create!(number: "2345", date: "08/03/20", time: "11:00", departure_city: "Denver", arrival_city: "Los Angeles", airline: southwest)

      passenger_1 = Passenger.create!(name: "Snoop", age: 48)
      passenger_2 = Passenger.create!(name: "Game", age: 40)
      passenger_3 = Passenger.create!(name: "Kendrick", age: 33)
      passenger_4 = Passenger.create!(name: "Roscoe", age: 15)
      passenger_5 = Passenger.create!(name: "Dwayne", age: 8)

      FlightPassenger.create(flight: flight, passenger: passenger_1)
      FlightPassenger.create(flight: flight, passenger: passenger_2)
      FlightPassenger.create(flight: flight, passenger: passenger_3)
      FlightPassenger.create(flight: flight, passenger: passenger_4)
      FlightPassenger.create(flight: flight, passenger: passenger_5)

      expect(flight.count_minors).to eq(2)
    end

    it "#count_adults" do
      southwest = Airline.create!(name: "Southwest")

      flight = Flight.create!(number: "2345", date: "08/03/20", time: "11:00", departure_city: "Denver", arrival_city: "Los Angeles", airline: southwest)

      passenger_1 = Passenger.create!(name: "Snoop", age: 48)
      passenger_2 = Passenger.create!(name: "Game", age: 40)
      passenger_3 = Passenger.create!(name: "Kendrick", age: 33)
      passenger_4 = Passenger.create!(name: "Roscoe", age: 15)
      passenger_5 = Passenger.create!(name: "Dwayne", age: 8)

      FlightPassenger.create(flight: flight, passenger: passenger_1)
      FlightPassenger.create(flight: flight, passenger: passenger_2)
      FlightPassenger.create(flight: flight, passenger: passenger_3)
      FlightPassenger.create(flight: flight, passenger: passenger_4)
      FlightPassenger.create(flight: flight, passenger: passenger_5)

      expect(flight.count_adults).to eq(3)
    end
  end
end
