class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  # validates_presence_of :email
  # validates_presence_of :first_name
  # validates_presence_of :last_name
  has_many :posts,dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy

  def feed
    Post.where("user_id = ?", id)
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end



end