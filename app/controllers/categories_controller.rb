class CategoriesController < ApplicationController
  def show
    @posts = Post.where(category: params[:id])
    @categories = Post.category.values
    # 検索
    @q = Post.ransack(params[:q])
  end
end
