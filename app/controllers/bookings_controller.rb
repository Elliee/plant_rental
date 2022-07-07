class BookingsController < ApplicationController
  require 'date'
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy]

  def new
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @plant = Plant.find(params[:plant_id])
    @booking.plant = @plant
    @booking.status = "Pending"
    if @booking.save
      flash.notice = "Booking complete!"
      redirect_to outbound_bookings_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to outbound_bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to outbound_bookings_path
  end

  def outbound_bookings
    date = Date.today
    @bookings = Booking.all.filter { |booking| booking.user_id == current_user.id && booking.end_date > date }
    @past_bookings = Booking.all.select { |b| b.end_date < date }

  end

  def inbound_bookings
    my_plants = current_user.plants.map { |plant| plant.id }
    @bookings = Booking.all.select { |booking| my_plants.include? booking.plant_id }
  end

  def accept_booking
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "Approved")
    flash.notice = "Booking approved!"
    redirect_to inbound_bookings_path
  end

  def decline_booking
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: "Declined")
    flash.notice = "Booking declined"
    redirect_to inbound_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :plant_id)
  end
end
