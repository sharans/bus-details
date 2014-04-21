class BusController < ApplicationController
  ROUTES = {
      "M15" => ['mylapore', 'adayar', 'velachery', 'pallikaranai', 'medavakkam'],
      "219A" => ['ambattur', 'golden flats', 'anna nagar', 't nagar', 'tidel']
  }
  DIRECTIONS = ["ONWARD", "RETURN"]

  def board
    BusLocation.create!(bus_number: params[:bus_number], source: params[:source], destination: params[:destination], lat: params[:lat], lng: params[:lng])
    head :ok
  end

  def locate
    bus_no = params[:bus_number]
    source = params[:source]
    dest = params[:dest]
    direction =  find_direction(bus_no, source, dest)

    head :ok
  end

  private
  def find_direction(bus_no, source, dest)
    route = ROUTES[bus_no]
    route.index(source) < route.index(dest) ? "ONWARD" : "RETURN"
  end
end