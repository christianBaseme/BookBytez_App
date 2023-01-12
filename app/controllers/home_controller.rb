require 'will_paginate/active_record'
class HomeController < ApplicationController
  before_filter :authenticate_with_http_digest
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  def index
    if signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

  end


end
