require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid with empty content" do
    post = build(:post, content: "")
    expect(post).not_to be_valid
  end

  it "is invalid with empty user" do
    post = build(:post, user_id: nil)
    expect(post).not_to be_valid
  end
end
