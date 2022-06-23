module HealthHelper
  require 'net/http'

  @@uri = URI(TemperatureGetter::ACCUWEATHER_API_URL + TemperatureGetter::CONDITIONS + TemperatureGetter::CITI + '/historical/24?' + "apikey= #{ENV['API_KEY']}")

  def status(uri = @@uri)
    begin
    res = Net::HTTP.get_response(uri)
    # Status
    if res.code == '200'
      'OK'
    else
      'FAIL'
    end
    rescue SocketError => e
      e.class
      # redirect_to weather_index_url
    end
  end
end
