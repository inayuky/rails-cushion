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

  it "orders most recent first" do
    create(:post)
    create(:post, :old)
    create(:post, :too_old)
    most_recent_post = create(:post, :most_recent)
    create(:post, :old)
    expect(Post.first).to eq most_recent_post
  end
end
