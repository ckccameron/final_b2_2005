class FlightsController < ApplicationController
  def index
  end
  
  def show
    @flight = Flight.find(params[:id])
  end
end
