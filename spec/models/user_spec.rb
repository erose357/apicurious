require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:uid) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_uniqueness_of(:token) }
  end 

  context "Class methods" do
    it "creates or updates itself from an oauth hash" do
      auth = {
        provider: "github",
        uid:      "12345678",
        credentials: {
            token: "faketesttoken"
          },
        info: {
          nickname: "unit_test",
          email:    "unit_test@email.com",
          name:     "The Fake Dude"
        }
      }
      User.update_or_create(auth)
      new_user = User.first

      expect(new_user.provider).to eq("github")
      expect(new_user.uid).to eq("12345678")
      expect(new_user.nickname).to eq("unit_test")
      expect(new_user.email).to eq("unit_test@email.com")
      expect(new_user.name).to eq("The Fake Dude")
      expect(new_user.token).to eq("faketesttoken")
    end
  end
end
