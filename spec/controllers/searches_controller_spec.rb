require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'POST #create' do
    context 'with a valid search query' do
      it 'creates a new search' do
        post :create, params: { query: 'Ruby on Rails' }
        expect(response).to have_http_status(:success)
        expect(Search.count).to eq(1)
      end
    end

    context 'with an empty search query' do
      it 'does not create a new search' do
        post :create, params: { query: '' }
        expect(response).to have_http_status(:success)
        expect(Search.count).to eq(0)
      end
    end
  end

  describe 'GET #all_searches' do
    it 'returns all unique searches' do
      create(:search, query: 'Ruby on Rails', ip_address: '192.168.0.1')
      create(:search, query: 'JavaScript', ip_address: '192.168.0.2')

      get :all_searches

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['searches'].count).to eq(2)
    end
  end
end
