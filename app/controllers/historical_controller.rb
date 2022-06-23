class HistoricalController < ApplicationController
  include WeatherHelper
  before_action :weather_nil

  def index
  end

  def min
    @min = min_temp
  end

  def max
    @max = max_temp
  end

  def avg
    @avg = avg_temp
  end

  private

  def weather_nil
    if WeatherHelper::CASH.nil?
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end
end
