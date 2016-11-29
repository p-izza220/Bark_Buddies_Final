Rails.application.routes.draw do
  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'owners/index'

  # get 'owners/new'

  # get 'owners/show'

  # get 'owners/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/owners"				=> "owners#index", as: "owners"
  get "/owners/new"			=> "owners#new", as: "owners_new"
  post "/owners"			=> "owners#create"
  get "/owners/:id"			=> "owners#show", as: "owners_show"
  get "/owners/:id/edit"	=> "owners#edit"
  put "/owners/:id"			=> "owners#update"
  patch "/owners/:id"     	=> "owners#update"
  delete "/owners/:id"		=> "owners#destroy"

  get "/sessions/new"		=> "sessions#new", as: "login"
  post "/sessions"			=> "sessions#create"
  delete "/sessions/:id"  	=> "sessions#destroy", as: "logout" 

end
