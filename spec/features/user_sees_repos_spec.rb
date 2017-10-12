require 'rails_helper'

feature "Authenticated user" do
  
  let(:user) { User.new(provider: 'github',
                        uid:      '12345678',
                        nickname: 'fakeguy',
                        email:    'fakeemail@email.com',
                        name:     'thedude',
                        token:    ENV['github_user_token']) }
      
  it "sees a list of their repositories" do
    VCR.use_cassette("user_repos") do
  
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/dashboard"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_css("li.repo", count: 30)
    end
  end
end
