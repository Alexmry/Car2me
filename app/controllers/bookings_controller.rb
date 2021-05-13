class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :destroy, :update]

    def index
        @bookings = Booking.where(user_id: current_user.id)
        @cars = find_cars()
    end

    def create
      @booking = Booking.new()
      @booking.user_id = current_user.id
      @booking.confirmed = nil
      @booking.car_id = params[:car_id]
      if @booking.save
        redirect_to bookings_path
      else
        render :show
      end
    end

    def new
        @booking = Booking.new()
    end

    def destroy
        @booking.destroy
    end

    def update
        if params[:confirmed] == "true"
            @booking.confirmed = true
        else
            @booking.confirmed = false
        end
        redirect_to bookings_path
    end

    def edit
        @car = Car.find(@booking.car_id)
        @client = User.find(@booking.car_id)
    end

    def show
        @car = Car.find(@booking.car_id)
        @owner = User.find(@car.user_id)
    end

    private

    def booking_params
        params.require(:bookings).permit(:confirmed, :car_id, :user_id)
    end

    def set_booking
        @booking = Booking.find(params[:id])
    end

    def find_cars
        cars = []
        @bookings.each do |booking|
            if booking.user_id == current_user
                cars << booking.car_id
            end
        end
        cars.map { |car_id| Car.find(car_id) }
        return cars
    end
end

