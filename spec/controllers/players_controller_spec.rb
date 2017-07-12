require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  context 'POST #create' do
    it 'responds with status code 201' do
      post :create, params: { player: { email_address: 'test', password: 'test', username: 'test', avatar_asset_link: 'test/test/test.test' } }
      expect(response.status).to eq 201
    end

    it 'responds with a json' do
      post :create, params: { player: { email_address: 'test', password: 'test', username: 'test', avatar_asset_link: 'test/test/test.test' } }
      expect(response.content_type).to eq "application/json"
    end

    it 'responds with a player' do
      post :create, params: { player: { email_address: 'test', password: 'test', username: 'test', avatar_asset_link: 'test/test/test.test' } }
      expect(response.body).to include("player")
    end
  end

  context 'GET #show' do
    it 'responds with status code 200' do

      expect(response.status).to eq 200
    end

    it 'responds with a json' do
      expect(response.content_type).to eq "application/json"
    end

    it 'responds with a player' do
      post :create, params: { player: { email_address: 'test', password: 'test', username: 'test', avatar_asset_link: 'test/test/test.test' } }
      respone
      expect(response.body).to include("player")
    end

    it 'responds with status code 404 if no player can\'t be found' do
      post :show, params: { id: 2 }
      expect(response.status).to eq 404
    end
  end
end
