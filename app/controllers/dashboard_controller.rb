class DashboardController < ApplicationController
  def index
    @dashboard_index = DashboardIndexService.new(current_user)
  end
end
