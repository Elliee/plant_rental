class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :title, :description, :category, :price_per_day, presence: true
end
