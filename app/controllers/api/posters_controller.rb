class Api::PostersController < ApplicationController
  before_action :set_poster, only: [:show, :update, :destroy]

  def index
    @posters = Poster.all

    render json: @posters
  end

  def create
    @poster = Poster.new(poster_params)

    if @poster.save
      render json: @poster, status: :created
    else
      render json: @poster.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @poster
  end

  def update
    if @poster.update(poster_params)
      render json: @poster
    else
      render json: @poster.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @poster.destroy
  end

  private
    def set_poster
      @poster = Poster.find(params[:id])
    end
    def poster_params
      params.permit(:title, :featured, :brandName, :location, :transmission_type, :price, :leased, :model_year, :milage, :fuel_type, :engine_capacity, :mobile_number, images: [])
    end
end
