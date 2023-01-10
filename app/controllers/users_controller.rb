class UsersController < ApplicationController
  before_action :set_user, only: [:show ] #, :edit, :update, :destroy ]
  before_filter :signed_in_user, only: [:show,:update ] #[:index, :edit, :update, :destroy]
  before_filter :current_user, only: [:show,:edit, :update, :destroy] #[:index, :edit, :update, :destroy]

  include SessionsHelper


  #the show method is typically used to display a single record from a database.
  def show
    @user = @current_user
    if !current_user?(params[:id])
      # flash[:error] = "You are not authorized to view this page."
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



  private

    def user_params
      params.require(:user).permit(:first_name,:last_name, :course, :email,:major,:role,:followers,:following, :password, :password_confirmation)
    end


    def set_user
      @user = User.find(params[:id])
      redirect_to root_path if @user.nil?
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
