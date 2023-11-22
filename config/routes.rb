Rails.application.routes.draw do
  devise_for :users
  root "hello#index"

  # Memosに関連するルートを追加
  resources :memos
end
