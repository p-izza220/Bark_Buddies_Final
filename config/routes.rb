Rails.application.routes.draw do
  

  # get "password_resets/new"   => "password_resets#new"
  # get "password_resets/edit/:id"  => "password_resets#edit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/"                 => "welcome#index", as: "home"
  get "/welcome/new"      => "welcome#new", as: "the_rules"


  get "/owners"				    => "owners#index", as: "owner"
  get "/owners/new"			  => "owners#new", as: "owners_new"
  post "/owners"			    => "owners#create"
  get "/owners/:id"			=> "owners#show", as: "owners_show"
  get "/owners/:id/edit"	=> "owners#edit", as: "owners_edit"
  put "/owners/:id"			=> "owners#update", as: "owners_update"
  patch "/owners/:id"     	=> "owners#update"
  delete "/owners/:id"		=> "owners#destroy"

  get "/sessions"		=> "sessions#new", as: "login"
  post "/sessions"			=> "sessions#create"
  delete "/sessions"  	=> "sessions#destroy", as: "logout" 

  get "/checkin"      => "owners#checkin_with_cam"
  get "/checkout"       => "owners#checkout"


  resources :password_resets, only: [:new, :create, :edit, :update]
end
