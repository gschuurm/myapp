Myapp::Application.routes.draw do
  resources :albums do
    resources :photos
  end

  root :to => 'visitors#new'
end
