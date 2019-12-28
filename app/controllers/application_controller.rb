class ApplicationController < ActionController::Base

  def valid_dates?
    @valid_dates = false
    if !params[:start_date].blank? && !params[:end_date].blank?
      if params[:start_date].to_date > params[:end_date].to_date
        render json: {message: 'The start date must be less than the end date' , error: true}, status: :unprocessable_entity
        return 
      else 
        @valid_dates = true
      end
    end
  end
end
