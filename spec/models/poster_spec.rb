require 'rails_helper'

RSpec.describe Poster, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:featured) }
    it { should validate_presence_of(:brandName) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:transmission_type) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:leased) }
    it { should validate_presence_of(:model_year) }
    it { should validate_presence_of(:milage) }
    it { should validate_presence_of(:fuel_type) }
    it { should validate_presence_of(:engine_capacity) }
    it { should validate_presence_of(:mobile_number) }
  end
end
