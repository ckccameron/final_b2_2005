require 'rails_helper'

RSpec.describe "passenger show page" do
  it "displays passenger's name with all flight numbers to their flights which also happen to be links" do
    southwest = Airline.create!(name: "Southwest")

    flight_1 = southwest.flights.create!(number: "2345", date: "08/03/20", time: "11:00", departure_city: "Denver", arrival_city: "Los Angeles", airline: southwest)
    flight_2 = southwest.flights.create!(number: "3777", date: "09/03/20", time: "08:15", departure_city: "Denver", arrival_city: "New York", airline: southwest)
    flight_3 = southwest.flights.create!(number: "9863", date: "09/23/20", time: "15:30", departure_city: "Denver", arrival_city: "San Diego", airline: southwest)

    passenger = Passenger.create!(name: "Nipsey", age: 48)

    FlightPassenger.create(flight: flight_1, passenger: passenger)
    FlightPassenger.create(flight: flight_2, passenger: passenger)
    FlightPassenger.create(flight: flight_3, passenger: passenger)

    visit "/passengers/#{passenger.id}"

    expect(page).to have_content("Nipsey's Passenger Info")
    expect(page).to have_content("Flight Numbers For Nipsey")

    within "#flights-#{flight_1.id}" do
      expect(page).to have_link("2345")
      click_on "2345"
      expect(current_path).to eq("/flights/#{flight_1.id}")
    end

    within "#flights-#{flight_2.id}" do
      expect(page).to have_link("3777")
      click_on "3777"
      expect(current_path).to eq("/flights/#{flight_2.id}")
    end

    within "#flights-#{flight_3.id}" do
      expect(page).to have_link("9863")
      click_on "9863"
      expect(current_path).to eq("/flights/#{flight_3.id}")
    end
  end

  it "displays form to add flight to passenger" do
    southwest = Airline.create!(name: "Southwest")

    flight_1 = southwest.flights.create!(number: "2345", date: "08/03/20", time: "11:00", departure_city: "Denver", arrival_city: "Los Angeles", airline: southwest)
    flight_2 = southwest.flights.create!(number: "3777", date: "09/03/20", time: "08:15", departure_city: "Denver", arrival_city: "New York", airline: southwest)
    flight_3 = southwest.flights.create!(number: "9863", date: "09/23/20", time: "15:30", departure_city: "Denver", arrival_city: "San Diego", airline: southwest)

    passenger = Passenger.create!(name: "Nipsey", age: 48)

    FlightPassenger.create(flight: flight_1, passenger: passenger)
    FlightPassenger.create(flight: flight_2, passenger: passenger)
    FlightPassenger.create(flight: flight_3, passenger: passenger)

    new_flight = southwest.flights.create!(number: "1234", date: "08/07/20", time: "18:00", departure_city: "Denver", arrival_city: "Houston", airline: southwest)

    visit "/passengers/#{passenger.id}"

    fill_in "Flight Number:", with: "#{new_flight.number}"
    click_on "Submit"

    expect(current_path).to eq("/passengers/#{passenger.id}")
    expect(page).to have_content("1234")
  end
end
