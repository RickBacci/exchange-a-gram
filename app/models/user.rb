class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.provider = oauth.provider
    user.uid      = oauth.uid
    user.nickname = oauth.info.nickname
    user.name     = oauth.info.name
    user.image    = oauth.info.image
    user.bio      = oauth.info.bio
    user.website  = oauth.info.website
    user.extra    = oauth.info.extra
    user.token    = oauth.credentials.token
    user.save

    user
  end

  # def self.instagram_client
  #   @client ||= Instagram.client(access_token: current_user.token)
  # end
  #
  # def user_media_feed
  #   instagram_client.user_media_feed
  # end
end

