Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pt_BR/ do
    devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords"
    }

    root "posts#index"

    post "posts/upload", to: "posts#upload"

    resources :posts do
      resources :comments, only: [ :create ]
    end
  end
end
