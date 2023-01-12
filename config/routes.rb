Rails.application.routes.draw do
  get '/homes' => 'homes#top'

  get '/books' => 'books#index'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show'

  get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
