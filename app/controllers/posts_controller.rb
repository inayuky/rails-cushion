class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    if @current_user
      @post = @current_user.posts.build(post_params)
      if @post.save
        flash[:success] = "投稿しました"
        redirect_to posts_url
      else
        flash[:danger] = "投稿に失敗しました"
        render "new"
      end
    else
      flash[:danger] = "投稿に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to posts_url
    else
      flash[:danger] = "投稿の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_url
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
