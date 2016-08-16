class ReservationsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_place


  def create

    @reservation = @place.reservations.new(reservation_params)
    @reservation.customer = current_customer

    if @reservation.save
      redirect_to @place, notice: "reservation was saved."
    else
      redirect_to @place, notice: "reservation is not valid."
    end
  end

  def destroy
    @reservation = @place.reservations.find(params[:id])
    @reservation.destroy
    redirect_to @place
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date,:number_of_people)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
