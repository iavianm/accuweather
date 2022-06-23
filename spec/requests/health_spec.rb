require 'rails_helper'

RSpec.describe "Healths", type: :request do
  describe "Response success" do
    it "GET /health/index" do
      get "/health/index"
      expect(response).to have_http_status(:success)
    end
  end
end
