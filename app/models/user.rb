class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アカウント公開・非公開
  enum status:{nonreleased: 0, released: 1}

  # carrierwave関連付け
  mount_uploader :image, ImagesUploader

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # 自分が作った通知(active_notifications)と自分宛の通知(passive_notifications)の関連付け
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  #フォロー時の通知
  # def create_notification_follow!(current_user)
  #   temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
  #   if temp.blank?
  #     notification = current_user.active_notifications.new(
  #       visited_id: id,
  #       action: 'follow'
  #     )
  #     notification.save if notification.valid?
  #   end
  # end
end
