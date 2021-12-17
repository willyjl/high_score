require 'rails_helper'

RSpec.describe ScoresController, type: :controller do
  describe 'GET index' do
    before { create_list(:score, 12) }

    it 'renders first page' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to include(score_format)
      expect(parsed_response.length).to eq(10)
    end

    it 'renders second page' do
      get :index, params: { page: 2 }, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to include(score_format)
      expect(parsed_response.length).to eq(2)
    end
  end

  describe 'POST create' do
    let(:username) { 'j01' }
    let(:point) { 41 }

    it 'creates user' do
      post :create, params: { score: { username: username, point: point } }, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response['point']).to eq(41)
      expect(User.find_by(username: username)).not_to be_nil
    end
  end

  describe 'GET show' do
    let(:score) { create(:score) }

    it 'renders successfully' do
      get :show, params: { id: score.id }, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to match(score_format)
    end

    it 'renders not found' do
      get :show, params: { id: 999 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'DELETE destroy' do
    let(:score) { create(:score) }

    it 'deletes successfully' do
      delete :destroy, params: { id: score.id }, format: :json
      expect(response).to have_http_status(:ok)
      expect(parsed_response).to match(score_format)
    end

    it 'renders not found' do
      delete :destroy, params: { id: 999 }, format: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
