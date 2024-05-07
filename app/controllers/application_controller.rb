class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def home
    garages = Car.all.pluck(:garage).uniq.map do |garage|
      {
        name: garage,
        cars_url: cars_url(garage: garage)
      }
    end
    render json: {
      documentation: "https://github.com/lewagon/garage-api#readme",
      garages: garages,
    }
  end

  def routing_error
    render json: {
      error: "This path is not valid for this API"
    }, status: 404
  end
end
