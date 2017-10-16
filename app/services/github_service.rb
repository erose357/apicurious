class GithubService
  def initialize(user)
    @user = user
    @conn = Faraday.new(url:"https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{user.token}"
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def user_info
    parse_json(conn.get("/user"))
  end

  def repos
    parse_json(conn.get("/user/repos"))
  end


  private
    attr_reader :user, :conn

  def parse_json(response) 
    JSON.parse(response.body, symbolize_names: true)
  end
end
