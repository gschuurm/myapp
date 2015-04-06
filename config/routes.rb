Myapp::Application.routes.draw do
  resources :pi_settings

  resources :albums do
    resources :photos
  end

  root :to => 'visitors#new'
end
