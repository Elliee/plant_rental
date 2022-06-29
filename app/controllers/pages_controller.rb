class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    if current_user
      @user = current_user
      @plants = @user.plants
      @bookings = Booking.where(user: @user)
    else
      redirect_to new_user_session_url
    end
  end

end
