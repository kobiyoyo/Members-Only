class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]
 
	def signed_in_user
		unless signed_in?
			redirect_to signin_url
		end 
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id 
		@post.save
		redirect_to root_path
	end

	def index
		@posts = Post.all
	end

end
