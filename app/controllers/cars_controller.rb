class CarsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @cars = Car.all
  end

  def show
    @booking = Booking.new
    @review = Review.new(list: @list)
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_list
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:Car).permit(:model, :brand, :price)
  end
end
