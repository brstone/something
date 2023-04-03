Rails.application.routes.draw do
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  resources :posts
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #goes to pages action and looks for a home action
   root "pages#home"
   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
end