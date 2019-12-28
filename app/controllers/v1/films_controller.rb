class V1::FilmsController < ApplicationController
  before_action :valid_dates?,:set_film, only: :index

  def index
    render json: { films: @films.collect(&:details)}, status: :ok
  end

  def create
    if film = Film.create(film_params)
      render json: { film: film}, status: :ok
    else
      render json: { errors: film.errors.full_messages.to_sentence, error: true }, status: :unprocessable_entity
    end
  end

  private

  def film_params
    params.require(:film).permit(:name, :description, :url_image, :start_date, :end_date)
  end

  def set_film
    begin
      @films =  @valid_dates ? Film.actives.by_dates(params[:start_date].to_date, params[:end_date].to_date) : Film.actives
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: "not_found" }, status: :not_found
    end
  end
end