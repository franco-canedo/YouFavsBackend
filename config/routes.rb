Rails.application.routes.draw do
  resources :category_videos
  resources :videos
  resources :categories
  resources :users


  get "/logout", to: "sessions#destroy"
  get "/auth/google_oauth2/callback", to: "sessions#create_session"
  get 'auth/failure', to: redirect('/')
  resource :session, only: [:create, :destroy]
  post '/auth/google_oauth', to: "sessions#create_session"
  get 'auth/profile', to: 'sessions#profile'
  get '/user/categories', to: 'categories#user_categories'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
