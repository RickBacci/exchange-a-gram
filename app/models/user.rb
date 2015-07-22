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

  def instagram_client
    @client ||= Instagram.client(access_token: token)
  end

  def media_feed
    instagram_client.user_media_feed
  end

  def media
    instagram_client.user.counts.media
  end

  def follows
    instagram_client.user.counts.follows
  end

  def followed_by
    instagram_client.user.counts.followed_by
  end

  


end
