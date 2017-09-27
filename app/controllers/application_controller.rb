class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def home
    garages = Car.all.pluck(:garage).uniq.map do |garage|
      {
        name: garage,
        cars_url: cars_url(garage: garage)
      }
    end
    render json: {
      garages: garages,
    }
  end

  def routing_error
    render json: {
      error: "This path is not valid for this API"
    }, status: 404
  end
end
