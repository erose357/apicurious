require 'rails_helper'

describe GithubService do
  let(:user) { User.new(name: 'Walter') }
  let(:github_service) { GithubService.new(user) }

  context "class methods" do
    it "return a valid object" do
      expect(github_service).to be_a(GithubService)
    end
  end
end
