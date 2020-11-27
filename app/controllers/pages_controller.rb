class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @user = current_user
    #@recent_bookings = Booking.order
    @array_outfit = @user.bookings.map do |book|
      book[:outfit_id]
      end
  end

  def dashboard
     @user = current_user
     @given_reviews = @user.reviews
     @outfits = @user.outfits

     # @incoming_reviews = @user.incoming_reviews
     @bookings = @user.bookings
     # @incoming_bookings = @user.incoming_bookings
  end

end
