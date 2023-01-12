class HomeController < ApplicationController
  before_filter :authenticate_with_http_digest
  def index
    if signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

  end


end
