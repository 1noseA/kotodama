class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
      flash[:success] = "投稿しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_path(current_user)
      flash[:success] = "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:success] = "削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:word, :source, :who, :category, :episode, :genre, :status, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
