class TemperatureGetter
  class << self
    def call(key:, city:)
      new(key, city).call
    end
  end
  
  def call
    temp_hours_hash = {}
    response = HTTParty.get(ACCUWEATHER_API_URL + CONDITIONS + "#{@city_key}" + '/historical/24?',query: accu_weather_params, format: :json).parsed_response
    response.each do |hour|
      temp_hours_hash[hour["EpochTime"]] = hour['Temperature']['Metric']['Value']
    end
    temp_hours_hash
  end

  private

  attr_reader :api_key, :city_key

  ACCUWEATHER_API_URL = 'http://dataservice.accuweather.com/'.freeze
  CONDITIONS = 'currentconditions/v1/'.freeze

  def initialize(api_key, city)
    @api_key = api_key
    @city_key = city
  end
 
  def accu_weather_params
    {
      apikey: @api_key,
      metric: true,
      language: 'ru-ru'
    }
  end
end
