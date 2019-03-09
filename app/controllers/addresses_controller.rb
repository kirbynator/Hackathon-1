class AddressesController < ApplicationController
  before_action :set_trip
  before_action :set_location
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    
  end

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def create
    @address = @location.addresses.new(the_params)
    if @address.save
    
      redirect_to user_trip_path(current_user, @location.trip_id)
    else 
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @address.destroy
    redirect_to user_trip_path(current_user, @location.trip_id)
  end

  private 
  def the_params
    params.require(:address).permit(:name, :top, :done)
  end
  
  def set_trip
    
    @trip = trip.find(params[:trip_id])
  end

  def set_location
    @location = location.find(params[:location_id])
  end

  def set_addreses
    @addreses = addreses.find(params[:id])
  end
end
