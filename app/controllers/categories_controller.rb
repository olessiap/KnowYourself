class CategoriesController < ApplicationController

	def index 
		@categories = Category.all
		#@special
	end 

	def show
		@category = Category.find(params[:id])
		#redirect_to "/users/#{current_user.id}/categories/#{@category.id}"
	end
end        