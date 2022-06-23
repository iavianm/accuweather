class TemperatureGetter
  class << self
    def call(key:)
      new(key).call
    end
  end

  begin
  def call
    temp_hours_hash = {}
    response ||= HTTParty.get(ACCUWEATHER_API_URL + CONDITIONS + CITI + '/historical/24?',query: accuweather_params, format: :json).parsed_response
    response.each do |hour|
      temp_hours_hash[hour["EpochTime"]] = hour['Temperature']['Metric']['Value']
    end
    temp_hours_hash
  end
  rescue TypeError => e
    e.class
  rescue SocketError => e
    e.class
  end
  private

  attr_reader :api_key

  ACCUWEATHER_API_URL = 'http://dataservice.accuweather.com/'.freeze
  CONDITIONS = 'currentconditions/v1/'.freeze
  CITI = '294021'.freeze

  def initialize(api_key)
    @api_key = api_key
  end
 
  def accuweather_params
    {
      apikey: @api_key,
      metric: true,
      language: 'ru-ru'
    }
  end
end
