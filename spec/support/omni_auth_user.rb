module OmniAuthUser
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new(
      {
        provider: 'instagram',
        uid: '75',
        info: {
          nickname: "me",
          name: "Ricky",
        },
        credentials: {
          token: ENV['instagram_token'],
          secret: "secretpizza"
        }
      })
  end
end
