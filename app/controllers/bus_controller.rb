class BusController < ApplicationController
  def board
    puts "*" * 80
    puts params[:bus_no].inspect
    puts params.inspect
  end
end