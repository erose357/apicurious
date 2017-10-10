class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :token, presence: true, uniqueness: true

  def self.update_or_create(auth_hash)
    user = User.find_by(uid: auth_hash[:uid]) || User.new
    user.attributes = {
      provider: auth_hash[:provider],
      uid:      auth_hash[:uid],
      nickname: auth_hash[:info][:nickname],
      email:    auth_hash[:info][:email],
      name:     auth_hash[:info][:name],
      token: auth_hash[:credentials][:token]
    }
    user.save!
    user
  end
end
