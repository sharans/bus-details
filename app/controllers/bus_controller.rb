class BusController < ApplicationController
  ROUTES = {
      "M15" => ['mylapore', 'adayar', 'velachery', 'pallikaranai', 'medavakkam'],
      "219A" => ['Ambattur', 'Collector Nagar', 'Thirumangalam', 't nagar', 'tidel']
  }
  DIRECTIONS = ["ONWARD", "RETURN"]

  def board
    BusLocation.create!(bus_number: params[:bus_number], source: params[:source], destination: params[:destination], lat: params[:lat], lng: params[:lng])
    head :ok
  end

  def locate
    bus_number = params[:bus_number]
    source = params[:source]
    dest = params[:dest] #currently unused - will be used for direction computation
    #direction =  find_direction(bus_no, source, dest)
    render json: buses_along(bus_number, source) #assuming direction is onward - can compute direction later.
  end

  private
  def buses_along(bus_number, source)
    starting_points = starting_points(bus_number, source)
    BusLocation.where(bus_number: bus_number, source: starting_points)
  end

  def starting_points(bus_number, source)
    ROUTES[bus_number].slice(0, ROUTES[bus_number].index(source))
  end

  def find_direction(bus_no, source, dest)
    route = ROUTES[bus_no]
    route.index(source) < route.index(dest) ? "ONWARD" : "RETURN"
  end
end