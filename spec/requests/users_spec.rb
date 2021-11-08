require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    set_user_to_session(create(:user))
  end

  describe "GET /users" do
    it "responds normal" do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show user" do
    it "responds normal" do
      get user_path(create(:user))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit user" do
    it "responds normal" do
      user = create(:user)
      set_user_to_session(user)
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new user" do
    it "responds normal" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create user" do
    it "create user and responds normal" do
      user_params = attributes_for(:user)
      expect {
        post users_path, params: { user: user_params }
      }.to change{ User.count }.by(1)
      expect(response).to redirect_to(user_path(User.last)) # TODO 作成されたuserはUser.lastで必ず取得できるのか？
    end
  end

  describe "PUT update user" do
    it "update user and responds normal" do
      user = create(:user)
      set_user_to_session(user)
      user_params = attributes_for(:user)
      put user_path(user), params: { user: user_params }
      expect(response).to redirect_to(user)
      user.reload
      expect(user.name).to eq user_params[:name]
      expect(user.email).to eq user_params[:email]
    end
  end

  describe "DELETE destroy user" do
    it "destroy user and responds normal" do
      user = create(:user)
      set_user_to_session(user)
      expect {
        delete user_path(user)
      }.to change{ User.count }.by(-1)
      expect(response).to redirect_to(users_url)
    end
  end

end
