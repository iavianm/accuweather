class WeatherController < ApplicationController
  include WeatherHelper
  before_action :weather_nil, except: :index

  def index
  end

  def current
    @current = current_temp
  end

  def by_time
    @timestamps = by_time_temp(params[:timestamp])
    # binding.pry
    if @timestamps.nil?
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  private

  def weather_nil
    if WeatherHelper::CASH.nil?
      redirect_to health_index_url
    end
  end
end
