Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  # Memosに関連するルートを追加
  resources :memos
end
