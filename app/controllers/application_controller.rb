class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def routing_error
    render json: {
      error: "This path is not valid for this API"
    }, status: 404
  end
end
