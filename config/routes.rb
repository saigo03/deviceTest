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

  #お問合せ用ルート
  resources :posts, only: [:new, :create, :index, :show] do
    member do
      get 'adminshow'
    end
  end
  # タグに関連するルートを追加
  resources :tags, only: [:new, :create]

end
