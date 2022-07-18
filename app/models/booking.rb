class Booking < ApplicationRecord
  require 'date'
  belongs_to :user
  belongs_to :plant
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def booking_total
    days = (end_date - start_date).to_i
    total = days * plant.price_per_day
    return total
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
    date = Date.today
    if start_date < date
      errors.add(:start_date, "Start date cannot be in the past")
    end
  end

end
