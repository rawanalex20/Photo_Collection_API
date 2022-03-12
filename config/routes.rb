Rails.application.routes.draw do
  resources :photos
  resources :venues do
    resources :photos
  end
  resources :users do
    resources :photos
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
