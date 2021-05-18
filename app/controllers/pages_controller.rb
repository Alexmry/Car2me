class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    #@cars = Car.all no need as we have it below if query is not present
     if params[:query].present?
    @cars = Car.search_by_model_and_address(params[:query])
    else
      @cars = Car.all
    end
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end
end

#car.all on line 10 to display all cars rather than the search.
