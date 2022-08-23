# frozen_string_literal: true

# Model for the Poster table
class Poster < ApplicationRecord
  # scope :title , -> (title, searchedTitle){where("#{title} ILIKE ?", "%#{searchedTitle}%")}
  scope :title , -> (title) { where title: title }
  scope :featured , -> (featured) { where featured: featured }
  scope :brandName , -> (brandName) { where brandName: brandName }
  scope :location , -> (location) { where location: location }
  scope :transmission_type , -> (transmission_type) { where transmission_type: transmission_type }
  scope :price , -> (price) { where price: price }

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
