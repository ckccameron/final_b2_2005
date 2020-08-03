# README

Base repository for B2 Final Assessment.

This repository requires and has rbeen tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec, SimpleCov, and Shoulda-Matchers have been installed and set up.


## Setup
1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd final_b2_2005`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Database information
* Airlines have a name
 (Ex: Airline.create(name: “Frontier”))
* Flights have a number, date, time, departure city, and arrival city
 (Ex: Flight.create(number: “1727”, date: “08/03/20”, departure_city: “Denver”, arrival_city: “Reno”)) -- for this app, it does not matter how you format the flight’s date
* Passengers have a name and age
 (Ex: Passenger.create(name: “Joe”, age: 7))
​
