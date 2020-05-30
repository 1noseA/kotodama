class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page])
  end
  
  def show
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

  # アカウント公開・非公開
  def release
    @user =  User.find(params[:user_id])
    @user.released! unless @user.released?
    redirect_to user_path(@user), notice: 'このアカウントを公開しました'
  end

  def nonrelease
    @user =  User.find(params[:user_id])
    @user.nonreleased! unless @user.nonreleased?
    redirect_to user_path(@user), notice: 'このアカウントを非公開にしました'
  end

  private

  def user_params
    params.require(:user).permit(:user, :image, :introduction, :status)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
