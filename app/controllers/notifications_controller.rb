class NotificationsController < ApplicationController
  def index
    #current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications.page(params[:page])
    #indexを開いたらchecked:falseが全てchecked:trueになるように
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    #通知を全削除
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end
