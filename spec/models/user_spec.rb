require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with all attr" do
    user = build(:user)
    expect(user).to be_valid
  end

  describe "validation" do
    it "is invalid with empty name" do
      user = build(:user, name: "")
      expect(user).not_to be_valid
    end

    it "is invalid with too long name" do
      user = build(:user, name: "a" * 101)
      expect(user).not_to be_valid
    end

    it "is invalid with empty email" do
      user = build(:user, email: "")
      expect(user).not_to be_valid
    end

    it "is invalid with empty password" do
      user = build(:user, password: "")
      expect(user).not_to be_valid
    end
  end

  describe "relation" do
    it "destroy post when user is destroyed" do
      user = create(:post).user
      expect{ user.destroy }.to change{ Post.count }.by(-1)
    end
  end
end
