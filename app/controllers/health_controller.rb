class HealthController < ApplicationController
  def index
    @health = HealthHelper.setup
  end
end
