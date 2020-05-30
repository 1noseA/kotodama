class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
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
end
