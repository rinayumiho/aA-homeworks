require 'rails_helper'

RSpec.describe User, type: :model do

  #is_password?, #reset_session_token, and ::find_by_credentials
  pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    FactoryBot.build(:user, email: "Long@gmail.com", password: "chen123")
  end

  describe "validationis" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "methods" do
    describe "#is_password?" do
      it "should validate the password" do
        allow(user).to receive(:password_digest).with(BCrypt::Password.new("chen123"))
        expect(BCrypt::Password.create("chen123")).to eq(user.password_digest)
      end
    end

    describe "#reset_session_token!" do
      it "should return a new session token" do
        session_token = User.generate_session_token
        allow(user).to receive(:session_token).with(session_token)
        expect(user.reset_session_token!).to eq(session_token)
      end
    end

    describe "::find_by_credentials" do
      it "should return a user object" do
        valid_user = User.find_by("Long@gmail.com", "chen123")
        expect(valid_user).to eql(user)
      end

      it "should return a nil" do
        invalid_user = User.find_by("Long2@gmail.com", "chen12")
        expect(invalid_user).to be_nil
      end
    end

  end
end
