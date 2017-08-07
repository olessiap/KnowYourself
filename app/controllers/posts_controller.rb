class PostsController < ApplicationController
	#before_action :authenticate_user!
	before_action :load_category

	def index 
		@posts = User.find(params[:user_id]).posts.order(id: :desc)
	end 

	def show
    p params
    
		@post = User.find(params[:user_id]).posts.find(params[:id])
	end

	def new
		@post = Post.new
		p @post.errors
	end

	def create
		@post = Post.new(post_params.merge({user_id: current_user.id, category: @category}))
		if @post.save 
			flash[:notice] = "post successfully created!"
			redirect_to "/users/#{@current_user.id}/categories/#{@category.id}/posts/#{@post.id}"
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:id].permit(:post_title, :post_description))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
    @post = Post.find(params[:id])
  	if @post.destroy
    	redirect_to root_path
  	end
  end

	private

	def post_params
		params.require(:post).permit(:post_title, :post_description)
		#.merge(user_id: params[:user_id], category_id: params[:category_id])
	end

	def load_category
		@category = Category.find(params[:category_id])
	end

end