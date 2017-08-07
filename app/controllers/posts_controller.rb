class PostsController < ApplicationController
	before_action :authenticate_user!

	def index 
		@posts = User.find(params[:user_id]).posts.order(id: :desc)
	end 

	def show
		@post = Post.find(params[:user_id])
	end

	def new
		@post = Post.new(post_params)
	end

	def create
		p @post.errors
    p params
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "post successfully created!"
			redirect_to "/users#{current_user.id}/categories/#{current_category.id}/posts/#{@post.id}"
		else
			render 'new'
		end
	end

	def post_params
		params.require(:post).permit(:post_title, :post_description).merge(category_id: params[:category_id])
	end

end