class Plant < ApplicationRecord
  belongs_to :user

  validates :title, :description, :category, :price_per_day, presence: true
end
