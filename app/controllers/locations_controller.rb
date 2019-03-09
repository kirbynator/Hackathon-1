class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @list = @trip.lists.new
  end

  def create
    @list = @trip.lists.new(the_params)
    if @list.save
      redirect_to @trip
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(the_params)
      redirect_to @trip
    else 
      render :edit
  end
end

  def destroy
    @list.destroy
    redirect_to trips_path
  end

  private 
  def the_params
    params.require(:list).permit(:name)
  end
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
