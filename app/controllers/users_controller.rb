class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.page(params[:page])
  end
  
  def show
    @posts = Post.where(user_id: current_user.id).page(params[:page])
    @favorite_posts = Post.joins(:favorites).where(favorites: { user_id: current_user.id }).page(params[:page])
    @random = @posts + @favorite_posts.order("RANDOM()").limit(5)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:success] = "プロフィール編集完了！"
    else
      render :edit 
    end
  end

  def hide
    @user = User.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @user.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ご利用ありがとうございました"
    redirect_to root_path
  end

  # アカウント公開・非公開
  def publish
    @user =  User.find(params[:user_id])
    @user.publish! unless @user.publish?
    redirect_to user_path(@user), notice: 'このアカウントを公開しました'
  end

  def privated
    @user =  User.find(params[:user_id])
    @user.privated! unless @user.privated?
    redirect_to user_path(@user), notice: 'このアカウントを非公開にしました'
  end

  private

  def user_params
    params.require(:user).permit(:user, :image, :introduction, :status)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end
end
