require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "user creation and login the user" do
    # user creation
    user_params = attributes_for(:user)
    visit new_user_path
    fill_in "名前", with: user_params[:name]
    fill_in "Eメール", with: user_params[:email]
    fill_in "パスワード", with: user_params[:password]
    click_button "登録"
    expect(page).to have_content("ユーザ登録が完了しました")
    expect(page).to have_content("ログアウト")

    # logout
    click_link "ログアウト"
    expect(page).to have_content("ログアウトしました")

    # login
    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user_params[:email]
    fill_in "パスワード", with: user_params[:password]
    click_button "ログイン"
    expect(page).to have_content("ログインしました")
  end

  scenario "login succeed and post deletion succeed" do
    create(:same_user)
    create(:post)
    user_params = attributes_for(:same_user)
    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user_params[:email]
    fill_in "パスワード", with: user_params[:password]
    click_button "ログイン"
    expect(page).to have_content("ログインしました")
    expect(page).to have_content("投稿一覧")
    click_link "削除"
    expect(page).to have_content("投稿を削除しました")
  end

  scenario "login fails without input" do
    create(:user)
    visit root_path
    click_link "ログイン"
    click_button "ログイン"
    expect(page).to have_content("ログインに失敗しました")
  end

end