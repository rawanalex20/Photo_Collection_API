Rails.application.routes.draw do
  resources :venues do
    resources :photos
  end
  resources :users do
    resources :photos
  end

end
