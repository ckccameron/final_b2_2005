require 'rails_helper'

RSpec.describe "flight show page" do
  it "displays flight's info, airline it belongs to and passengers on board" do
    southwest = Airline.create!(name: "Southwest")

    flight = Flight.create!(number: "2345", date: "08/03/20", time: "11:00", departure_city: "Denver", arrival_city: "Los Angeles", airline: southwest)

    passenger_1 = Passenger.create!(name: "Snoop", age: 48)
    passenger_2 = Passenger.create!(name: "Game", age: 40)
    passenger_3 = Passenger.create!(name: "Kendrick", age: 33)

    FlightPassenger.create(flight: flight, passenger: passenger_1)
    FlightPassenger.create(flight: flight, passenger: passenger_2)
    FlightPassenger.create(flight: flight, passenger: passenger_3)

    visit "/flights/#{flight.id}"

    expect(page).to have_content("Airline: Southwest")
    expect(page).to have_content("Number: 2345")
    expect(page).to have_content("Date: 08/03/20")
    expect(page).to have_content("Time: 11:00")
    expect(page).to have_content("Departure City: Denver")
    expect(page).to have_content("Arrival City: Los Angeles")
    expect(page).to have_content("Snoop")
    expect(page).to have_content("Game")
    expect(page).to have_content("Kendrick")
  end

  it "displays count of minors and adults on flight" do
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

    expect(page).to have_content("There are 2 minors on board this flight")
    expect(page).to have_content("There are 3 adults on board this flight")
  end
end
