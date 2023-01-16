Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # root :to 最初の画面になる
  root :to => 'homes#top'
  # コントローラの同じ名前のアクションに紐づく形で、以下のルーティングを自動生成する
  resources :books
end