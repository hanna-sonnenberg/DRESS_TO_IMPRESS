class ReviewsController < ApplicationController
  before_action :set_outfit, only: [:new, :create]

  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    @review.outfit = @outfit
    if @review.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to outfit_path(@review.outfit)
  end

  private

  def set_outfit
    @outfit = Cocktail.find(params[:outfit_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
