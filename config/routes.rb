Rails.application.routes.draw do
  get '/' => "main#learnlog"

  resources :users
  resources :times
  resource :logins, only: :new

  get "up" => "rails/health#show", as: :rails_health_check 
  #ヘルスチェック用ルーティング　残す 
end
