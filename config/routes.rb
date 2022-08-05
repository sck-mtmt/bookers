Rails.application.routes.draw do
  root :to => 'homes#top'
  get '/top'=>'homes#top'
  resources :books
  patch 'books/:id' => 'books#update', as: 'update_book'


end
