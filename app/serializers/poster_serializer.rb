class PosterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :featured, :brandName, :location, :transmission_type, :price, :leased, :model_year, :fuel_type, :engine_capacity, :mobile_number, :images

  def images
    object.images.map do |image| ( "http://localhost:3000#{rails_blob_path(image, only_path: true)}")
    end
  end
end
