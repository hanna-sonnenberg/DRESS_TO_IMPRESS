class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
     search
  end

  def dashboard
     @user = current_user
     @given_reviews = @user.reviews
     @outfits = @user.outfits

     # @incoming_reviews = @user.incoming_reviews
     @bookings = @user.bookings
     # @incoming_bookings = @user.incoming_bookings
  end

  private

  def search
    # categories and dates
    word = params["search"]
    @outfits = Outfit.where("category ILIKE ?", "%#{word}%")

  end

end
