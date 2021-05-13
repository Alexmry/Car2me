class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :destroy, :update]

    def index
        # where allows you to search for all booking(s)
        # you have boooked
        @bookings = current_user.bookings
        @cars = current_user.booked_cars
        # Other people booked
    end

    def create
      @booking = Booking.new()
      # @booking.user_id = current_user.id
      @booking.user = current_user
      @booking.confirmed = nil
      @booking.car_id = params[:car_id] # did not return anyhting null
      if @booking.save
        redirect_to bookings_path
      else
        render :show  # we dont create a form when press book btn/ alert instead.
      end
    end

    def new
        @booking = Booking.new()
    end

    def destroy
        @booking.destroy
    end

    def update
        if params[:confirmed] == "true" #Hidden field tag exaplined
            @booking.confirmed = true
        else
            @booking.confirmed = false
        end
        redirect_to bookings_path
        # @booking = Booking.new(booking_params)
    end
    # @booking

    def edit
#       @car = Car.where(id: @booking.car_id).first #Could use .find too
#       @client = User.where(id: @booking.car_id).first
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

end
# join table- when you do this explain to us!
