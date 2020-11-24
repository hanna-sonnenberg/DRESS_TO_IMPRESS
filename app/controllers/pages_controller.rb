class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
     search
  end

  private

  def search
    # categories and dates
    word = params["search"]
    @outfits = Outfit.where("category ILIKE ?", "%#{word}%")

  end

end
