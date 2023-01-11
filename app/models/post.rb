class Post < ApplicationRecord
  belongs_to :user


  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'posts.created_at DESC'


end
