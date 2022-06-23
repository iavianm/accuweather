require 'rails_helper'
require 'net/http'

RSpec.describe HealthHelper, type: :helper do
  describe "#Health connection" do
    let(:uri) { URI('https://www.google.com') }
    let(:uri_bad) { URI('https://www.google.co') }

    it "returns OK" do
      expect(helper.status(uri)).to eq('OK')
    end

    it "returns FAIL" do
      expect(helper.status(uri_bad)).to eq('FAIL')
    end
  end
end

