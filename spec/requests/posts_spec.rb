require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    set_user_to_session(create(:user))
  end

  describe "GET /posts" do
    it "responds normal" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create post" do
    it "creates post and responds normal" do
      post_params = attributes_for(:post)
      user = create(:user)
      set_user_to_session(user)
      post_params[:user_id] = user.id
      expect {
        post posts_path, params: { post: post_params }
      }.to change { Post.count }.by(1)
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "GET show post" do
    it "responds normal" do
      get post_path(create(:post))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit post" do
    it "responds normal" do
      post = create(:post)
      set_user_to_session(post.user) # TODO 先にuserをcreateして、set_user_to_sessionし、beforeでは実行しない方がいいか。
      get edit_post_path(post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update post" do
    it "updates post and responds normal" do
      @post = create(:post)
      set_user_to_session(@post.user) # TODO 先にuserをcreateして、set_user_to_sessionし、beforeでは実行しない方がいいか。
      post_params = attributes_for(:post)
      put post_path(@post), params: { post: post_params }
      expect(response).to redirect_to(posts_url)
      @post.reload
      expect(@post.content).to eq post_params[:content]
    end
  end

  describe "DELETE destroy post" do
    it "destroy post and responds normal" do
      post = create(:post)
      set_user_to_session(post.user) # TODO 先にuserをcreateして、set_user_to_sessionし、beforeでは実行しない方がいいか。
      expect {
        delete post_path(post)
      }.to change { Post.count }.by(-1)
      expect(response).to redirect_to(posts_url)
    end
  end

end