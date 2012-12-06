Dummy::Application.routes.draw do
  match '/users/signup' => 'registrations#create', :via => :post, :as => 'signin'

  match '/users/signup' => 'registrations#new', :via => :get, :as => 'signup'

  delete '/users/signout' => 'sessions#destroy', :as => 'signout'

  match '/users/signin' => 'sessions#new', :via => :get, :as => 'signin'

  match '/users/signin' => 'sessions#create', :via => :post, :as => 'signin'

  match "/home" => "home#index"
  root :to => "home#index"
end
