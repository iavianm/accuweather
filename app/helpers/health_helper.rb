module HealthHelper
  require 'net/http'
  # pry
  @@uri = URI(TemperatureGetter::ACCUWEATHER_API_URL + TemperatureGetter::CONDITIONS + TemperatureGetter::CITI + '/historical/24?' + "apikey= #{ENV['API_KEY']}")

  def status(uri = @@uri)
    res = Net::HTTP.get_response(uri)
    # Status
    if res.code == '200'
      'OK'
    else
      'FAIL'
    end
  end
end
