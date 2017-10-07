require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth 
    visit root_path
    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"
    expect(page).to have_link("Logout")
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "provider" => "github",
    "uid" => "12345678",
    "info" => {
      "nickname" => "test123",
      "email"    => "test@email.com",
      "name"     => "Fake Guy",
      "urls" => {
        "Github" => "www.fake-github.com"
      },
      "credentials" => {
        "token" => "biglongfaketokenmadeupfortest"
      }
    }
  })
end