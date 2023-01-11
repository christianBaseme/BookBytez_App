class SessionsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include SessionsHelper

  def new

  end


  def create


    # email = params[:email]
    # password = params[:password]
    @user = User.find_by_email(params.fetch(:session,{}).fetch(:email,"").downcase)
    if @user && @user.authenticate(params[:session][:password])
      #session[:@user_id] = @user.id
      sign_in @user
      #redirect_back_or @user
      flash[:notice] = "Successfully logged in"
      redirect_to @user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    #session[:@user_id] = nil
    sign_out
    redirect_to root_path
  end
end
