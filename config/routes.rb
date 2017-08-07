Rails.application.routes.draw do
  
  root to: 'home#index'

  devise_for :users

  resources :users do 
  	resources :categories do 
  		resources :posts
		end
	end
end
