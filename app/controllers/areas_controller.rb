class AreasController < ApplicationController
  def show
    area = Area.find params[:id]
    render json: area, status: 201
  end

  def index
  area= Area.all
  render json: area
  end

  def create
    area = Area.new(area_params)
    if area.save
      render json: area, status: 201
    else
      render json: { errors: area.errors }, status: 422
    end
  end

  private

  def area_params
    params.require(:area).permit(
      :neighborhood
    )
  end
end
