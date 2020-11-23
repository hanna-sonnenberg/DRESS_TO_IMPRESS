class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :delete, :edit, :update, :destroy]

  def index
    @outfits = Outfit.all
  end

  def show
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
      render :edit
    end
  end

  def destroy
    @outfit.destroy
    redirect_to root_path, notice: 'Outfit was successfully destroyed.'
  end

  def create
     @outfit = Outfit.new(outfit_params)
     if @outfit.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outfit
      @outfit = Outfit.find(params[:id])
    end

    def outfit_params
      params.require(:outfit).permit(:name, :photo)
    end
end
