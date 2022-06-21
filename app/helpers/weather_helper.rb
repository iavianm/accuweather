module WeatherHelper

  def self.temp_hash
    api_key = Rails.application.credentials.accuweather.dig(:api_key)
    TemperatureGetter.(key: api_key)
  end

  CASH ||= temp_hash

  def self.max(temp = CASH)
    # binding.pry
    if temp.nil?
      return temp
    end
    max = temp.values.first
    temp.each_value do |num|
      if max < num
        max = num
      end
    end
    max
  end

  def self.min(temp = CASH)
    if temp.nil?
      return temp
    end
    min = temp.values.first
    temp.each_value do |num|
      if min > num
        min = num
      end
    end
    min
  end

  def self.avg(temp = CASH)
    if temp.nil?
      return temp
    end
    avg = 0
    count = 0
    temp.each_value do |num|
      avg += num
      count += 1
    end
    (avg / count).ceil(1)
  end

  def self.by_time(time = 1, hash = CASH)
    keys = []
    hash.each_key do |key|
      keys << key.to_s.to_i
    end
    result = []
    keys.each do |key|
      result << key if key < time.to_i + 5600 && key >= time.to_i
    end
    result
    key = result.last
    p hash[key]
  end
end
