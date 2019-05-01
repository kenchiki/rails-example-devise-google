class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[google_oauth2]

  def self.find_or_create_user!(auth)
    find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
