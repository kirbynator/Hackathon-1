class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update, :destroy]
    def index
      @trips = current_user.trips
    end
  
    def show
    end
  
    def new
      @trip = current_user.trips.new
    end
  
    def create
      @trip = current_user.trips.new(the_params)
      if @trip.save
        redirect_to @trip
      else 
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @trip.update(the_params)
        redirect_to trips_path
      else 
        render :edit
    end
  end
  
    def destroy
      @trip.destroy
      redirect_to trips_path
    end
  
    private 
    def the_params
      params.require(:trip).permit(:name)
    end
  
    def set_trip
      @trip = current_user.trips.find(params[:id])
    end
  
end
