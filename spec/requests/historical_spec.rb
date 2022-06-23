require 'rails_helper'

RSpec.describe "Historical", type: :request do
  describe "#Response success" do
    it "GET /weather/historical" do
      get "/weather/historical"
      expect(response).to have_http_status(:success)
    end

    it "GET /weather/historical/min" do
      get "/weather/historical/min"
      expect(response).to have_http_status(:success)
    end

    it "GET /weather/historical/max" do
      get "/weather/historical/max"
      expect(response).to have_http_status(:success)
    end

    it "GET /weather/historical/AVG" do
      get "/weather/historical/avg"
      expect(response).to have_http_status(:success)
    end
  end
end
