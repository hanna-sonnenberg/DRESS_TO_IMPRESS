class BookingsController < ApplicationController
before_action :set_outfit, only: [:new, :create]

  def new
    @booking = Booking.new
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.outfit = @outfit
    if @booking.save
      redirect_to outfit_path(@outfit)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to outfit_path(@booking.outfit)
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:outfit_id])
  end

  def booking_params
    params.require(:booking).permit(:address, :start_date, :end_date)
  end
end