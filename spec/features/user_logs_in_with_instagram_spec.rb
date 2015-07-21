require 'rails_helper'

describe User, type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:instagram] = nil
    Capybara.app = ExchangeAGram::Application
    stub_omniauth
  end
  it 'can login with Instagam' do

    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("Ricky")

    assert page.has_link?("logout")
  end
end

