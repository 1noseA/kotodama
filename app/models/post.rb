class Post < ApplicationRecord
  belongs_to :user

  extend Enumerize

  enumerize :category,
    in: %i[quotations lyrics books comics movies science my someone other]

  enumerize :genre,
    in: %i[love family relationships work school health money myself other]

  # 投稿公開・非公開
  enum status:{nonreleased: 0, released: 1}

  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
