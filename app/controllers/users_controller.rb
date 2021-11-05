class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザ登録が完了しました"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "ユーザ登録に失敗しました"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザ情報の更新に成功しました"
      redirect_to @user
    else
      flash[:danger] = "ユーザ情報の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザ削除が完了しました"
    redirect_to users_url
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to posts_path
    else
      flash[:danger] = "ログインに失敗しました"
      render "login_form"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to login_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
