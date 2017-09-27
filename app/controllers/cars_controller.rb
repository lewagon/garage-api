class CarsController < ApplicationController
  def index
    render json: Car.where(garage: params[:garage])
  end

  def show
    render json: Car.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Could not find car with id #{params[:id]}" }, status: 404
  end

  def create
    car_params = params.require(:car).permit(:brand, :model, :plate, :owner)
    car = Car.new(car_params.merge(garage: params[:garage]))
    if car.save
      render json: car
    else
      render json: { errors: car.errors }, status: 422
    end
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    render json: { id: car.id, message: "Car #{car.id} has been removed" }
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Could not find car with id #{params[:id]}" }, status: 404
  end
end
