class AddFlightsToAirlines < ActiveRecord::Migration[5.1]
  def change
    add_reference :airlines, :flight, foreign_key: true
  end
end
