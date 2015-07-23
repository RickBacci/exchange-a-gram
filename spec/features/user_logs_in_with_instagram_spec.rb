require 'rails_helper'

describe User, type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:instagram] = nil
    Capybara.app = ExchangeAGram::Application
    stub_omniauth
  end

  it 'can login with instagram' do
    VCR.use_cassette("login") do
      visit root_path

      assert_equal 200, page.status_code
      click_link "login"

      expect(current_path).to eq(root_path)

      within('#logout') do
         expect(page).to have_link("logout")

      end
    end
  end
end

