class CarsController < ApplicationController
  def index
    @cars = Car.where(garage: params[:garage])
    respond_to do |format|
      format.json { render json: @cars }
      format.xml { render xml: @cars.to_xml }
    end
  end

  def show
    car = Car.find(params[:id])
    respond_to do |format|
      format.json { render json: car }
      format.xml { render xml: car.to_xml }
    end
  rescue ActiveRecord::RecordNotFound
    error = { error: "Could not find car with id #{params[:id]}" }
    respond_to do |format|
      format.json { render json: error, status: 404 }
      format.xml { render xml: error, status: 404, root: "error" }
    end
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
