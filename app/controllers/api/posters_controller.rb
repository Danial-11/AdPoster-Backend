# frozen_string_literal: true

# APi class
class Api::PostersController < ApplicationController
  before_action :set_poster, only: %i[show update destroy]

  def index
    @posters = Poster.all
    @posters = Poster.title(params[:title]) if params[:title].present?
    @posters = Poster.featured(params[:featured]) if params[:featured].present?
    @posters = Poster.brandName(params[:brandName]) if params[:brandName].present?
    @posters = Poster.location(params[:location]) if params[:location].present?
    @posters = Poster.transmission_type(params[:transmission_type]) if params[:transmission_type].present?
    @posters = Poster.price(params[:price]) if params[:price].present?

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
    params.permit(:title, :featured, :brandName, :location, :transmission_type, :price, :leased, :model_year,
                  :milage, :fuel_type, :engine_capacity, :mobile_number, images: [])
  end
end
