class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  # validates_presence_of :email
  # validates_presence_of :first_name
  # validates_presence_of :last_name
  has_many :posts,dependent: :destroy

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end



end