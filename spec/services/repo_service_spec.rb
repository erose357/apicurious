require 'rails_helper'

describe Repo do
  it "is instantiated with valid attributes" do
    attrs = { name: "Bill" }

    repo = Repo.new(attrs)

    expect(repo).to be_a Repo
    expect(repo.name).to eq("Bill")
  end
end
