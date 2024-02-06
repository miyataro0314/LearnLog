Rails.application.routes.draw do
  get '/', to: "main#top", as:"top"
  get "/about", to: "main#about", as: "about"

  resources :users

  get "/measurements", to: "measurements#new", as: "new_measurement"
  get "/measurements/index", to: "measurements#index", as: "measurements"
  get "/measurements/:id", to: "measurements#show", as: "measurement"
  get "measurements/:id/edit", to: "measurements#edit", as: "edit_measurement"
  patch "measurements/:id", to: "measurements#update"
  delete "measurements/:id", to: "measurements#destroy"
  post "/measurements/start", to: "measurements#start", as: "start"
  post "/measurements/end", to: "measurements#end", as: "end"

  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check 
  #ヘルスチェック用ルーティング　残す 
end
