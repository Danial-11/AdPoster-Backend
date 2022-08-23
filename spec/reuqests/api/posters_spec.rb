require 'rails_helper'

RSpec.describe 'Posters API', type: :request do
let!(:advertisement){ create(:poster) }
let(:valid_attributes) do
  {
    title: 'Kia Sportage for sale AWD',
    featured: 'yes',
    brandName: 'KIA',
    location: 'Islamabad',
    transmission_type: 'automatic',
    price: '20000K',
    leased: 'no',
    model_year: '2019',
    milage: '3200KMs',
    fuel_type: 'petrol',
    engine_capacity: '1.6L',
    mobile_number: '0300-1234567'
  }
end
let(:invalid_attributes) do
  {
    title: '',
    featured: '',
    brandName: '',
    location: '',
    transmission_type: '',
    price: '',
    leased: '',
    model_year: '',
    milage: '',
    fuel_type: '',
    engine_capacity: '',
    mobile_number: ''
  }
end

  describe 'GET /api/posters' do
    it 'returns posters' do
      expect do
        get api_posters_path
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end
    end

    it 'returns status code 200' do
      get api_posters_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/posters' do
    context 'when the request is valid' do
      it 'poster created' do
        expect do
          post api_posters_path(advertisement), params: valid_attributes
        end.to change(Poster, :count).by(1)
      end
    end

    context 'when the request is invalid' do
      before { post api_posters_path(advertisement), params: invalid_attributes }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PATCH /api/posters/:id' do
    before { patch api_poster_path(advertisement), params: valid_attributes }
    context 'when the record exists' do
      it 'updates the record' do
        expect(advertisement.reload.title).to eq('Kia Sportage for sale AWD')
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/posters/:id' do
    it 'deletes the record' do
      expect do
        delete api_poster_path(advertisement)
      end.to change(Poster, :count).by(-1)
    end
    it 'returns status code 204' do
      delete api_poster_path(advertisement)
      expect(response).to have_http_status(204)
    end
  end
end
