Rails.application.routes.draw do
	resources :gossips do
		resources :users, only: [:new, :create, :show] do 
			resources :villes, only: [:new, :create, :show]
		end
	end

	resources :sessions, only: [:new, :create, :destroy, :index]
	resources :users
	resources :likes, only: [:destroy]



	#get '/gossips', to: 'gossips#index'

	#get '/home', to: 'gossips#all_gossips'

	#get '/home/:gossip_id', to: 'gossips#details_gossips'

	#get '/home/:gossip_id/:user_id', to: 'gossips#details_gossips_user'

	get '/contact', to: 'contact#team_contact'
  
	get '/team', to: 'team#team_presentation'

	get '/', to: 'gossips#index'

	#get '/gossips/new', to: 'gossips#new_gossips'

	#post '/gossips/new', to: 'gossips#save_gossips'
	#root :to => "gossips#all_gossips" #'/homepage', to: 'gossips#all_gossips'

  
end









