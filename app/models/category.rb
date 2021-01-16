class Category < ApplicationRecord
  belongs_to :user
  has_many :category_videos
  has_many :videos, through: :category_videos
end
