class ReviewsController < ApplicationController
  before_action :set_outfit, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.outfit = @outfit
    @review.user = current_user
    if @review.save
      redirect_to outfit_path(@outfit)
    else
      @booking = Booking.new
      render "outfits/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to outfit_path(@review.outfit)
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])

  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
