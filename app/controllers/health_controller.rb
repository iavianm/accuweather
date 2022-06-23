class HealthController < ApplicationController
  include HealthHelper
  def index
    @health = status
  end
end
