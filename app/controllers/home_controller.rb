class HomeController < ApplicationController
  before_filter :authenticate_with_http_digest
  def index
    @post = current_user.posts.build if signed_in?

  end


end
