class V1::ReservationsController < ApplicationController
  before_action :valid_dates?, :set_reservation, only: :index

  def index
    render json: { reservations: @reservations.collect(&:details)}, status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.limit_reservations_by_film? <= 9
      reservation.active!
      reservation.save
      render json: { reservation: reservation }, status: :ok
    else
      render json: { errors: 'The film is full' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :document, :phone, :date, :film_id)
  end

  def set_reservation
    begin
      @reservations =  @valid_dates ? Reservation.by_dates(params[:start_date].to_date, params[:end_date].to_date) : Reservation.actives
    rescue => exception
      render json: { errors: "not_found" }, status: :not_found
    end
  end
end