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

  describe "DELETE #destroy" do
    context "when token is present with the id" do
      let!(:token) { create(:token) }

      it "should render with ok status code" do
        delete :destroy, params: { id: token._id }
        expect(response).to have_http_status(:ok)
      end

      it "should destroy the requested token" do
        expect do
          delete :destroy, params: { id: token._id }
        end.to change(Token, :count).by(-1)
      end
    end

    context "when token is not present with the id" do
      it "should render with not found status code" do
        delete :destroy, params: { id: "demoid1" }
        expect(response).to have_http_status(:not_found)
      end

      it "should not destroy any token" do
        expect do
          delete :destroy, params: { id: "demoid1" }
        end.to change(Token, :count).by(0)
      end
    end
  end

  describe "GET #assign" do
    before(:each) { Token.destroy_all }

    context "when token is available" do
      let(:available_token) { create(:token) }

      it "should render with ok status code" do
        available_token
        get :assign
        expect(response).to have_http_status(:ok)
      end

      it "should assign one token" do
        available_token
        get :assign
        expect(parsed_response["key"]).not_to eq(nil)
      end
    end

    context "when token is not available" do
      it "should render with not found status code" do
        get :assign
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

def parsed_response
  JSON.parse(response.body)
end
