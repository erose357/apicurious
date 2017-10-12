class DashboardController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{current_user.token}"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/user/repos")

    raw_repos = JSON.parse(response.body, symbolize_names: true)

    @repos = raw_repos.map do |repo|
      Repo.new(repo)
    end
  end
end
