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
          token: "175",
          secret: "secretpizza"
        }
      })
  end
end
