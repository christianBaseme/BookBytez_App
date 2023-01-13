class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, only: [:show , :edit, :update, :destroy , :following, :followers]
  before_filter :signed_in_user, only: [:show,:update ] #[:index, :edit, :update, :destroy]
  before_filter :current_user, only: [:show,:edit, :update, :destroy] #[:index, :edit, :update, :destroy]







  #the show method is typically used to display a single record from a database.
  def show
    @user = @current_user
    @posts = @user.posts.paginate(page: params[:page])
    if !current_user?(params[:id])
      flash[:warning]='Can only show profile of logged in user'

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit_profile
    render 'edit'
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/login'#user_path(@user)
    else
      render 'new'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private

    def user_params
      params.require(:user).permit(:first_name,:last_name, :course, :email,:major,:role,:followers,:following, :password, :password_confirmation)
    end


    def set_user
      @user = User.find(params[:id])
      redirect_to root_path if @user.nil?
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
