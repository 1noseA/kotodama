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
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  acts_as_paranoid
end
