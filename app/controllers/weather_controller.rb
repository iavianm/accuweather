class WeatherController < ApplicationController
  before_action :weather_nil, except: :index

  def index
  end

  def current
  end

  def by_time
    @timestamps = WeatherHelper.by_time(params[:timestamp])
    # binding.pry
    if @timestamps.nil?
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  private

  def weather_nil
    if WeatherHelper::CASH.nil?
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end
end
