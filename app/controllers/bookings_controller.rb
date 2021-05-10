class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :destroy]

    def index
        @bookings = Booking.all
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
    end

    def update 
    end

    def edit 
    end

    def show
    end

    private

    def booking_params
        params.require(:bookings).permit(:confirmed, :car_id, :user_id)
    end

    def set_booking
        @booking = Booking.find(params[:id])
    end
    
end
