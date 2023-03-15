class ApplicationController < ActionController::API
  include ActionController::Cookies
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found_response

  private
  def no_record_found_response
    render json: {error: "#{controller_name.classify} not found"}, status: :not_found
  end
end
