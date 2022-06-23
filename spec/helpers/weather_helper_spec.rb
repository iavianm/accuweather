require 'rails_helper'

RSpec.describe WeatherHelper, type: :helper do
  describe "Get weather" do
    let(:temp) { {'a'=>3, 'b'=>5, 'c'=>7, 'd'=>1} }
    it "return Current temp" do
      expect(helper.current_temp(temp)).to eq(3)
    end
    it "return MAX temp" do
      expect(helper.max_temp(temp)).to eq(7)
    end
    it "return MIN temp" do
      expect(helper.min_temp(temp)).to eq(1)
    end
    it "return AVG temp" do
      expect(helper.avg_temp(temp)).to eq(4)
    end
  end
end
