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
end
