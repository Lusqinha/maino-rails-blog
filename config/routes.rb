Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index" 
  resources :posts do
    resources :comments, only: [:create] 
  end
end
