class Review < ApplicationRecord
  belongs_to :booking

  validates :booking, uniqueness: true
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :content, presence: true
end
