require 'rails_helper'

describe DashboardIndexService do
  let(:user) { User.new(name: "Ted", token: ENV['github_user_token']) }
  let(:dashboard_index) { DashboardIndexService.new(user) }

  context "class methods" do
    context "initialize(current_user)" do
      it "returns a valid object" do
        dashboard_index = DashboardIndexService.new(user)

        expect(dashboard_index).to be_a(DashboardIndexService)
      end
    end
  end

  context "instance methods" do
    #context "#repos" do
      #it "returns a list of user repos" do
        #VCR.use_cassette("dashboard_index_repos") do
          #expect(dashboard_index.repos.count).to eq(30)
        #end
      #end
    #end

    context "#user_info" do
      #it "returns the users basic account info" do
        #VCR.use_cassette("dashboard_index_user_info") do
          #expect(dashboard_index.user_info.name).to eq("Eddie Rose")
          #expect(dashboard_index.user_info.email).to eq("erose357@gmail.com")
          #expect(dashboard_index.user_info.picture).to eq("https://avatars1.githubusercontent.com/u/25412073?v=4")
          #expect(dashboard_index.user_info.login).to eq("erose357")
        #end
      #end
    end
  end
end
