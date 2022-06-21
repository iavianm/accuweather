class HistoricalController < ApplicationController
  before_action :weather_nil

  def index
  end

  def min
    @min = WeatherHelper.min
  end

  def max
    @max = WeatherHelper.max
  end

  def avg
    @avg = WeatherHelper.avg
  end

  private

  def weather_nil
    if WeatherHelper.temp_hash.nil?
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end
end
