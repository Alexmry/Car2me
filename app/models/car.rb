class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :photos
  validates :model, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  validates :address, presence: true

   geocoded_by :address
   after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_model_and_address,
    against: [ :model, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
