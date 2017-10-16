class DashboardIndexService
  def initialize(current_user)
    @user = current_user
  end

  def repos
    raw_repos = GithubService.new(user).repos

    repos = raw_repos.map do |repo|
      Repo.new(repo)
    end
    repos
  end

  def user_info
    raw_info = GithubService.new(user).user_info
    user_info = UserInfo.new(raw_info)
  end

  private
    attr_reader :user

end
