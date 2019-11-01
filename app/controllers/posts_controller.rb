# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :signed_in_user, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end






  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def signed_in_user
    redirect_to signin_url unless signed_in?
  end
end
