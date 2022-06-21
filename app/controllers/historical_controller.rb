class HistoricalController < ApplicationController
  # before_action :get_weather, :get_city, :weather_nil
  def index
  end

  def min
    @min = WeatherHelper.min(@weather)
  end

  def max
    @max = WeatherHelper.max(@weather)
  end

  def avg
    @avg = WeatherHelper.avg(@weather)
  end

  private

  def get_weather
    @weather = City.last.weather
  end

  def get_city
    @city = City.last.name
  end

  def weather_nil
    if @weather.nil?
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end
end
