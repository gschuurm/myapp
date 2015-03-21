Myapp::Application.routes.draw do
  resources :albums

  resources :photos do
    resources :albums

    member do
      get :albums
      post :album_add
      post :album_remove
    end
  end

  root :to => 'visitors#new'
end
