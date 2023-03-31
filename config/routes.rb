Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #goes to pages action and looks for a home action
   root "pages#home"
end
