class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :title, :description, :category, :price_per_day,
            :watering, :size, :pet_friendly, :light, :care_level, presence: true
  def self.search(search)
    if search
      self.where("lower(title) LIKE ?", "%#{search.downcase}%")
    else
      Plant.all
    end
  end

end
