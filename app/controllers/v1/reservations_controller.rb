class V1::ReservationsController < ApplicationController
  before_action :valid_dates?, only: :index

  def index
    reservations =  @valid_dates ? Reservation.by_dates(params[:start_date].to_date, params[:end_date].to_date) : Reservation.actives

    render json: { reservations: reservations.collect(&:details)}, status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.limit_reservations_by_film? <= 9
      reservation.save
      render json: { reservation: reservation}, status: :ok
    else
      render json: { errors: reservation.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def reservation_params
    params.require(:reservation).permit(:name, :email, :document, :phone, :date, :film_id)
  end
end