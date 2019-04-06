class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[google_oauth2]

  def self.find_or_create_user!(auth)
    user = find_by(provider: auth.provider, uid: auth.uid) || build_user_by_auth(auth)
    user.save!
    user
  end

  def self.build_user_by_auth(auth)
    User.new do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end
end
