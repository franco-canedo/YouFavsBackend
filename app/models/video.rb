class Video < ApplicationRecord
  has_many :category_videos
  has_many :categories, through: :category_videos
  has_one :user, through: :category
end
