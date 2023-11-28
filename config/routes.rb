Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'home#index'
    # Memosに関連するルートを追加
  resources :memos
  get 'registration_complete', to: 'static_pages#registration_complete', as: 'registration_complete'
  get 'hello_index', to: 'hello#index', as: 'hello_index'
  get 'mypage', to: 'static_pages#'


end
