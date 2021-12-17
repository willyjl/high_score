require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    before { create_list(:user, 12) }

    it 'renders first page' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to include(user_format)
      expect(parsed_response.length).to eq(10)
    end

    it 'renders second page' do
      get :index, params: { page: 2 }, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to include(user_format)
      expect(parsed_response.length).to eq(2)
    end
  end

  describe 'GET show' do
    let(:user) { create(:user) }

    it 'renders successfully' do
      get :show, params: { id: user.id }, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to match(user_format(true))
    end

    it 'renders not found' do
      get :show, params: { id: 999 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
