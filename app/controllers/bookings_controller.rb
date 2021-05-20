class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :destroy, :update]

    def index
        # where allows you to search for all booking(s)
        # you have boooked
        @my_bookings = current_user.bookings
        @bookings = current_user.booked_cars
        # Other people booked
    end

    def create
      @booking = Booking.new()
      # @booking.user_id = current_user.id
      @booking.starts_at = params[:booking][:starts_at]  #how to implement this with strong params
      @booking.ends_at = params[:booking][:ends_at]
      @booking.user = current_user
      @booking.confirmed = nil
      @booking.car_id = params[:car_id] # did not return anyhting null
      if @booking.save
        redirect_to bookings_path  # we dont create a form when press book btn/ alert instead.
      end
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

    def destroy
        @booking.destroy 
        redirect_to bookings_path
    end

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
        params.require(:bookings).permit(:starts_at, :ends_at)
    end

    def set_booking
        @booking = Booking.find(params[:id])
    end

end
# join table- when you do this explain to us!
