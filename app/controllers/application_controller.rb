class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper



  # force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end


  protected
  def current_user?(id)
    @current_user.id.to_s == id
  end


end
