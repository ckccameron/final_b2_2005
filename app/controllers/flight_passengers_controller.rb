class FlightPassengersController < ApplicationController
  def create
    FlightPassenger.create(flight_passenger_params)
    redirect_to "/passengers/#{params[:passenger_id]}"
  end

  private
  def flight_passenger_params
    params.permit(:flight_id, :passenger_id)
  end
end
