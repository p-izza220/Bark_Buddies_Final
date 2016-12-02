Rails.application.routes.draw do
  
  # get 'welcome/index'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'owners/index'

  # get 'owners/new'

  # get 'owners/show'

  # get 'owners/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/"             => "welcome#index", as: "/"


  get "/owners"				  => "owners#index", as: "owners"
  get "/owners/new"			=> "owners#new", as: "owners_new"
  post "/owners"			=> "owners#create"
  get "/owners/:id"			=> "owners#show", as: "owners_show"
  get "/owners/:id/edit"	=> "owners#edit", as: "owners_edit"
  put "/owners/:id"			=> "owners#update"
  patch "/owners/:id"     	=> "owners#update"
  delete "/owners/:id"		=> "owners#destroy"

  get "/sessions"		=> "sessions#new", as: "login"
  post "/sessions"			=> "sessions#create"
  delete "/sessions"  	=> "sessions#destroy", as: "logout" 

  get "/checkin"      => "owners#checkin_with_cam"

end
