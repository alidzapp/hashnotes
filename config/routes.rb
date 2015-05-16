Rails.application.routes.draw do


  root  'posts#index'

  resources :posts

  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    #sessions
    get "/login" => "devise/sessions#new", :as => :new_user_session
    post "/login" => "devise/sessions#create", :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session

    #registrations
    get "/register" => "devise/registrations#new", :as => :new_user_registration
    post "/register" => "devise/registrations#create", :as => :user_registration
  end
end
