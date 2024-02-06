Rails.application.routes.draw do
  get '/' => "main#learnlog"

  resources :users
  resources :times

  get "/measure", to: "times#new", as: :new_times
  post "/measure/begin", to: "times#begin", as: :begin_times
  post "/measure/end", to: "times#end", as: :end_times
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check 
  #ヘルスチェック用ルーティング　残す 
end
