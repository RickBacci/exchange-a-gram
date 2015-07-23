require 'rails_helper'

RSpec.describe User, type: :model do
  def mock_auth
    {
      "provider" => "instagram",
      "uid" => "12334",
      "info" => {
        "nickname" => "brownieelf175",
        "name" => "Ricky",
        "image" => "https://igcdn-photos-b-a.akamaihd.net/hphotos-ak-xfa1/t51.2885-19/s150x150/11356565_1652474361678185_403755501_a.jpg",
        "bio" => "",
        "website" => ""
      },
      "credentials" => {
        "token" => ENV['instagram_token'],
        "expires" => false
      },
      "extra" => {}
    }
  end

  it 'creates a user from an auth hash' do
    user = User.find_or_create_from_oauth(mock_auth)

    expect(user).to be_valid
  end

  it 'should have a token' do
    user = User.find_or_create_from_oauth(mock_auth)

    expect(user.token).to eq(ENV['instagram_token'])
  end

  it 'has an instagram provider' do
    user = User.find_or_create_from_oauth(mock_auth)

    expect(user.provider).to eq("instagram")
  end
  it 'should have a client' do
    user = User.find_or_create_from_oauth(mock_auth)

    expect(user.instagram_client).to_not be_nil
  end

  it 'has a media feed' do
    VCR.use_cassette("media") do
      user = User.find_or_create_from_oauth(mock_auth)
     # expect(user.instagram_client.user.counts.media).to_not be_nil
    end
  end

end
