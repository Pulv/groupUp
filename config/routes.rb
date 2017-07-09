Rails.application.routes.draw do

  	root 'welcome#index'

  	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'

	get '/about', to: 'welcome#about'
	get '/contact', to: 'welcome#contact'
	get 'help', to: "welcome#help"

	
	resources :users
	resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
