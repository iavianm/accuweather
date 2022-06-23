module WeatherHelper
  api_key = ENV['API_KEY']
  CASH ||= TemperatureGetter.(key: api_key)

  def current_temp(temp = CASH)
    temp.values.first
  end

  def max_temp(temp = CASH)
    # binding.pry
    max = temp.values.first
    temp.each_value do |num|
      if max < num
        max = num
      end
    end
    max
  end

  def min_temp(temp = CASH)
    min = temp.values.first
    temp.each_value do |num|
      if min > num
        min = num
      end
    end
    min
  end

  def avg_temp(temp = CASH)
    avg = 0
    count = 0
    temp.each_value do |num|
      avg += num
      count += 1
    end
    (avg / count).ceil(1)
  end

  def by_time_temp(time, hash = CASH)
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
