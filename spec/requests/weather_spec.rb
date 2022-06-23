require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "Response success" do
    it "GET /weather" do
      get "/weather"
      expect(response).to have_http_status(:success)
    end

    it "GET /weather/current" do
      get "/weather/current"
      expect(response).to have_http_status(:success)
    end
  end

  describe "Response with 404 if timestamps nil" do
    it "returns 404 success" do
      get "/weather/by_time"
      expect(response.status).to eq(404)
    end
  end
end
