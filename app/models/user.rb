class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cars
  has_many :bookings
  has_many :booked_cars, through: :cars, source: :bookings
  # booked_cars is a name we give to an association
  # user through car table looks for bookings using source
  has_one_attached :photo
end
