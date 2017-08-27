require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user, email:"david@david.com", session_token: "blehhh", password:"password")
  end

  describe 'presence checks' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "resets the users token" do
      expect(user.session_token).to eq("blehhh")
      user.reset_session_token!
      expect(user.session_token).to_not be("blehhh")
    end
    it "returns new token" do
      expect(user.reset_session_token!).to be(user.session_token)
    end
  end

   describe "#is_password?" do
     it "verifies a password is correct" do
      expect(user.is_password?("password")).to be true
    end

    it "makes sure wrong pw is wrong" do
      expect(user.is_password?("wrongwrongwrong")).to be false
    end
   end

   describe "::find_by_credentials" do
     before { user.save! }

     it "finds if given correct credentials" do
       expect(User.find_by_credentials("david@david.com", "password")).to eq(user)
     end

     it "doesnt find if given wrong credentials" do
       expect(User.find_by_credentials("david@david.com", "ehh")).to_not eq(user)
     end

   end
end
