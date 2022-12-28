class SessionsController < ApplicationController
  def new

  end

  def create


    username = params[:username]
    password = params[:password]
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
  end


  def destroy
  end
end
