class Category < ApplicationRecord
  belongs_to :user
  has_many :category_videos, :dependent => :delete_all
  has_many :videos, through: :category_videos, :dependent => :delete_all
end
