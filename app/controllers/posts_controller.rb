class PostsController < ApplicationController

	def index 
		@categories = Category.all
	end 

	def show
		@categories = Category.find(params[:id])
	end
end