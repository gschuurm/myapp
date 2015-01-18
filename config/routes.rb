Myapp::Application.routes.draw do
  resources :photos

  root :to => 'visitors#new'
end
