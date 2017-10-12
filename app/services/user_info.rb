class UserInfo
  attr_reader :name, :login, :email, :picture
  def initialize(attrs)
    @name     = attrs[:name]
    @login    = attrs[:login]
    @email    = attrs[:email]
    @picture  = attrs[:avatar_url]
  end
end
