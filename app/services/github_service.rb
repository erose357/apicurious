class GithubService
  def initialize(user)
    @user = user
    #@conn = Faraday.new(url:"https://api.github.com") do |faraday|
      #faraday.headers["Authorization"] = "token #{user.token}"
      #faraday.adapter Faraday.default_adapter
    #end
  end
  
  def repos
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{user.token}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/user/repos")

    raw_repos = JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :user, :conn
end
