class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :model, presence: true
  validates :brand, presence: true
  validates :price, presence: true
end
