class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, only: [:edit, :update, :destroy]
  def index
    
  end

  def show
  end

  def new
    @address = Address.new
    render partial: "form"
  end

  def create
    @address = @loaction.addresses.new(the_params)
    if @address.save
    redirect_to trip_locations_path(@location.trip_id, @location)
    else 
      binding.pry
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @address.destroy
    redirect_to trip_locations_path(@location.trip_id, @location)
  end

  private 
  def the_params
    params.require(:address).permit(:street, :state, :city, :zip)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = @location.addresses.find(params[:id])
  end
end
