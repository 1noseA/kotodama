class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(post_id: params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post_id: @post.id)
    @favorite.save
    #通知の作成
    @post.create_notification_favorite!(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
end
