Rails.application.routes.draw do
  resources :products do
    collection do
      post :import
    end
    resources :comments
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end
