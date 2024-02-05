Rails.application.routes.draw do
  get '/' => "main#learnlog"

  resources :users

  get "up" => "rails/health#show", as: :rails_health_check  
end
