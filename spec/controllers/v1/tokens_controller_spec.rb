require "rails_helper"

describe V1::TokensController, type: :controller do
  describe "POST #create" do
    it "should render with created status code" do
      post :create
      expect(response).to have_http_status(:created)
    end

    it "should create a new token" do
      expect do
        post :create
      end.to change(Token, :count).by(1)
    end
  end
end
