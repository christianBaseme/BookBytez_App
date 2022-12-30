class UsersController < ApplicationController

  #the show method is typically used to display a single record from a database.
  def show
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
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end




  # def create
  #   @user = User.find_by(email: params[:session][:email])
  #   if @user && @user.authenticate(params[:session][:password])
  #     log_in @user
  #     redirect_to @user
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :course, :email,:major,:role,:followers,:following, :password, :password_confirmation)
  end

end
