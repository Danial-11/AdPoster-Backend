class Poster < ApplicationRecord
  has_many_attached :images
  validates :title, presence: true
  validates :featured, presence: true
  validates :brandName, presence: true
  validates :location, presence: true
  validates :transmission_type, presence: true
  validates :price, presence: true
  validates :leased, presence: true
  validates :model_year, presence: true
  validates :milage, presence: true
  validates :fuel_type, presence: true
  validates :engine_capacity, presence: true
  validates :mobile_number, presence: true
end
