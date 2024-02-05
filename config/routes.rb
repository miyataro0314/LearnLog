Rails.application.routes.draw do
  get '/' => "main#learnlog"

  resources :users
  resources :times
  resources :sessions, only: [:new, :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check 
  #ヘルスチェック用ルーティング　残す 
end
