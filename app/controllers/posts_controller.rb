class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    #@posts = Post.page(params[:page])
    @q = Post.ransack(params[:q])
    @categories = Post.category.values
    @genres = Post.genre.values
    @posts = @q.result(distinct: true).page(params[:page])
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      redirect_to posts_path
      flash[:notice] = "投稿しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash[:success] = "削除しました"
  end

  # 投稿公開・非公開
  def release
    @post = Post.find(params[:post_id])
    @post.released! unless @post.released?
    redirect_to posts_path, notice: '投稿を公開しました'
  end

  def nonrelease
    @post =  Post.find(params[:post_id])
    @post.nonreleased! unless @post.nonreleased?
    redirect_to posts_path, notice: '投稿を非公開にしました'
  end

  private

  def post_params
    params.require(:post).permit(:word, :source, :who, :category, :episode, :genre, :status, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end
end
