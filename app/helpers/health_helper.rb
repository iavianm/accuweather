module HealthHelper
  require 'net/http'
  # pry
  def self.setup
    uri = URI('https://www.google.com')
    res = Net::HTTP.get_response(uri)

    # Status
    if res.code == '200'
      return 'OK'
    else
      return 'FAIL'
    end
  end
end
