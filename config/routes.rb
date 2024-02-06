Rails.application.routes.draw do
  get '/' => "main#learnlog"

  resources :users
  resources :times

  get "/measurement", to: "measurements#new", as: :new_times
  post "/measurement/begin", to: "measurements#begin", as: :begin_times
  post "/measurement/end", to: "measurements#end", as: :end_times
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check 
  #ヘルスチェック用ルーティング　残す 
end
