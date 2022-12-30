class SessionsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    @current_user ||= User.find_by(id: session[:@user_id])
  end
  def new

  end

  # def log_in(@user)
  #   # code here
  # end

  def create


    email = params[:email]
    password = params[:password]
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      def log_in
        session[:@user_id] = @user.id
        #flash[:notice] = 'Valid email/password combination'
      end
      redirect_to @user
    else
      flash[:notice] = 'Invalid email/password combination'
      flash.now[:danger] = 'Invalid @username or password gmr;elkwmglkergklmr;elmgwlkmre;klgmlkerm;glkrmewlkgmrl;kewmgklrmew;lkgmrklewmg;lkmerklwgmr;lkemwgklmerklgmrk;lewmgklmerklwmgklmerk;lgmklermgkl;merwklgmkl;erwmgkl;ermlmklgrmkle;mgklr;emwlkgmer'
      render 'new'
    end
  end


  def destroy
    session[:@user_id] = nil
    redirect_to root_path
  end
end
