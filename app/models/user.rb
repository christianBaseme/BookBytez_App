class User < ApplicationRecord
  has_secure_password
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  validates_uniqueness_of :email
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  # validates_presence_of :email
  # validates_presence_of :first_name
  # validates_presence_of :last_name
  has_many :posts,dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, foreign_key: "followed_id", class_name:  "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def feed
    Post.where("user_id = ?", id)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)

  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end



end