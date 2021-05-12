class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :destroy]

    def index
        @bookings = Booking.where(user_id: current_user.id)
        @cars = find_cars()
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save 
            redirect_to bookings_path
        else
            render :new 
        end
    end

    def new
        @booking = Booking.new()
    end

    def destroy
        @booking.destroy
    end

    def update 
    end

    def edit
    end

    def show
        @car = Car.where(id: @booking.car_id)
        @client = User.where(id: @booking.car_id)
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
            if booking.user_id = current_user
                cars << booking.car_id
            end
        end
        cars.map { |car_id| Car.find(car_id)}
        return cars
    end
    
end
