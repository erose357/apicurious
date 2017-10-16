require 'rails_helper'

describe GithubService do
  let(:user) { User.new(name: 'Walter', token: ENV['github_user_token']) }
  let(:github_service) { GithubService.new(user) }

  context "class methods" do
    it "return a valid object" do
      expect(github_service).to be_a(GithubService)
    end
  end

  context "instance methods" do
    context "#repos" do
      it "returns a list of user repos" do
        VCR.use_cassette("github_service_repos") do
          expect(github_service.repos.count).to eq(30)
        end
      end
    end
  end

  context "#user_info" do
    it "returns basic user info" do
      VCR.use_cassette("github_service_user_info") do
        #left off here, write expectations
        results = github_service.user_info
      end
    end
  end
end
