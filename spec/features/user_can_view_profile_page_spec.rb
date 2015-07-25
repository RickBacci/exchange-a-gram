require 'rails_helper'

describe User, type: :feature do
  include OmniAuthUser

  before do
    OmniAuth.config.mock_auth[:instagram] = nil
    Capybara.app = ExchangeAGram::Application
    stub_omniauth
  end

  it 'can view profile page' do
    VCR.use_cassette("profile") do
      visit root_path
      assert_equal 200, page.status_code
      click_link "login"

      expect(current_path).to eq(root_path)
      save_and_open_page
      # within("li a.profile") do
      #   click_link "brownieelf175"
      # end

      # expect(page.status_code).to eq 200
      # expect(page).to have_content('Profile')
    end
  end
end

