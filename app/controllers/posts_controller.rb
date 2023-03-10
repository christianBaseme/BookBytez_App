class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'home/index'
    end

  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private
    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_url if @post.nil?
    end
end
