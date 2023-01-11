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
      render 'home/index'
    end

  end

  def show
  end

  def destroy

  end
end
