class GenresController < ApplicationController
  def show
    @posts = Post.where(genre: params[:id]).page(params[:page])
    @categories = Post.category.values
    @genres = Post.genre.values
    # 検索
    @q = Post.ransack(params[:q])
  end
end
