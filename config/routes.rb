Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt_BR/ do
    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords"
    }

    get "up" => "rails/health#show", as: :rails_health_check

    root "posts#index"
    resources :posts do
      resources :comments, only: [ :create ]
    end
  end
end
