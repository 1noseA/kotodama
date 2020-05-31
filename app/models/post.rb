class Post < ApplicationRecord
  belongs_to :user

  extend Enumerize

  enumerize :category,
    in: %i[quotations lyrics books comics movies science my someone other]

  enumerize :genre,
    in: %i[love family relationships work school health money myself other]
end