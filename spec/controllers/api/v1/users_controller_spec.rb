require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe "POST #create" do
    before do
      post :create, params: { username: 'jack' }
    end

    it "Create new user" do
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq(200)
      expect(json_response['message']).to eq('new user has been created.')
    end

    it "Check if user exists in the database" do
      post :create, params: { username: 'jack' }
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq(409)
      expect(json_response['message']).to eq('user already exists.')
    end
  end
end