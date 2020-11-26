class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_outfit, only: [:show, :delete, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        outfits.name @@ :query \
        OR outfits.description @@ :query \
        OR users.first_name @@ :query \
        OR users.last_name @@ :query \
      "
      @outfits = Outfit.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    elsif params[:category].present?
      @outfits = Outfit.where(category: params[:category])
      @category = params[:category]
    else
      @outfits = Outfit.all
    end

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @outfits.geocoded.map do |outfit|
      {
        lat: outfit.latitude,
        lng: outfit.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { outfit: outfit }),
        image_url: helpers.image_url('marker2.png')
      }
    end
  end

  def show
    @booking = Booking.new
    @marker =
      [{
        lat: @outfit.latitude,
        lng: @outfit.longitude,
        image_url: helpers.image_url('marker2.png')
      }]
    # sum_ratings = @outfit.review.sum
    # @average = sum_ratings / @outfit.reviews.length
  end

  def new
    @outfit = Outfit.new
  end

  def edit

  end

  def update
    if @outfit.update(outfit_params)
      redirect_to dashboard_path, notice: 'Outfit was successfully updated.'
    else
      render :edit, notice: "Something goes wrong..."
    end
  end

  def destroy
    @outfit.destroy
    redirect_to dashboard_path, notice: 'Outfit was successfully destroyed.'
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

      params.require(:outfit).permit(:name, :size, :gender, :price, :category, :location, :start_date, :end_date, :description, photos: [])

    end
end
