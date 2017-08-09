class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :load_category

	def index 
		@posts = current_user.posts.order(id: :desc)
	end 

	def show   
		@post = current_user.posts.find(params[:id])
	end

	def new
		@post = Post.new
		p @post.errors
	end

	def create
		p params 
		p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		@post = Post.new(post_params.merge({user_id: current_user.id, category: @category}))
		if @post.save 
			flash[:notice] = "post successfully created!"
			redirect_to "/categories/#{@category.id}/posts/#{@post.id}"
		else
			render 'new'
		end
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
		@post = current_user.posts.find(params[:id])
		@category = Category.find(params[:category_id])

		if @post.update(post_params)
			redirect_to category_post_path(@category, @post)
		else
			render 'edit'
		end
	end

	def destroy
  	@post = current_user.posts.find(params[:id])
			if @post.destroy
  			redirect_to root_path
			end
  end

	private

	def post_params
		params.require(:post).permit(:post_title, :post_description, :image)
		#.merge(user_id: params[:user_id], category_id: params[:category_id])
	end

	def load_category
		@category = Category.find(params[:category_id])
	end
end