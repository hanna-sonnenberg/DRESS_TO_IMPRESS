class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_outfit, only: [:show, :delete, :edit, :update, :destroy]

  def index
    @outfits = Outfit.where(category: params[:outfit])

  end

  def show
    @review = Review.new
    @booking = Booking.new
  end

  def new
    @outfit = Outfit.new
  end

  def edit
  end

  def update
    if @outfit.update(outfit_params)
      redirect_to outfit_path(@outfit), notice: 'Outfit was successfully updated.'
    else
      render :edit, notice: "Something goes wrong..."
    end
  end

  def destroy
    @outfit.destroy
    redirect_to root_path, notice: 'Outfit was successfully destroyed.'
  end

  def create
     @outfit = Outfit.new(outfit_params)
     @outfit.user = current_user
     if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  private

    def set_outfit
      @outfit = Outfit.find(params[:id])
    end

    def outfit_params
      params.require(:outfit).permit(:name, :size, :gender, :price, :category, :location, :photos, :start_date, :end_date)
    end
end
