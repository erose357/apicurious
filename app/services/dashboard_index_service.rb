class DashboardIndexService
  def initialize(current_user)
    @user = current_user
  end

  def repos
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{user.token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/user/repos")

    raw_repos = JSON.parse(response.body, symbolize_names: true)

    repos = raw_repos.map do |repo|
      Repo.new(repo)
    end
    repos
  end

  def user_info
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{user.token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/user")

    raw_info = JSON.parse(response.body, symbolize_names: true)
    user_info = UserInfo.new(raw_info)
  end

  private
    attr_reader :user

end
