require 'rails_helper'

RSpec.describe ShortsController, type: :controller do
	describe 'GET /stats in shorts#index' do		
    let(:short) { FactoryBot.create_list(:short, 10) }
    it 'status 200: Return all short' do
      short
      get :index
      expect(response.status).to eq(200)
    end
	end

	describe 'GET /short/{id} in shorts#show' do
		let(:short) { FactoryBot.create(:short) }
    it 'status 200: Return short' do
      get :show, params: { id: short.id }
      expect(response.status).to eq(302)
    end

    it 'status 404: Page not found' do
    	short = FactoryBot.create(:short, expire_date: Time.zone.now - 1.day)
      get :show, params: { id: short.id }
      expect(response.status).to eq(404)
    end
  end

  describe 'POST /short in shorts#create' do
  	let(:short) { FactoryBot.create(:short) }
    it 'status 201: Return record created successfully' do
      expect do
        post :create, params: {
        	short: {
        		url: 'https://google.com'
        	}
        }
      end. to change(Short, :count).by(1)
      expect(response.status).to eq(201)
    end
  end
end