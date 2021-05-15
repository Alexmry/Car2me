class CarsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  # skip_before_action :authenticate_user!, only: :search, show

  def index
    @cars = Car.all
  end

  def show
    @booking = Booking.new
    # @review = Review.new(list: @list)
    # @reviews = Review.where(list_id: list_id)
    @owner = User.find(@car.user_id)
    @markers = {
        lat: @car.latitude,
        lng: @car.longitude
      }
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to root_path
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_list
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :brand, :price, photos:[])
  end
end
