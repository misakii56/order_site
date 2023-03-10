Rails.application.routes.draw do




root to: 'public/homes#top'


  scope module: :public do
    delete 'cart_items/destroy_all'
    resources :cart_items
    get 'orders/new'
    post 'orders/log' => 'orders#log'
    get 'orders/thanx'
    resources :orders, only: [:new, :index, :show, :create]
    resources :items
    resources :addresses
    get 'homes/top'
    #root to: 'homes#top'
    #root to: 'public/sessions#new'
    get 'homes/about'
    get 'customers/quit' => 'customers#quit', as: 'quit'
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    patch 'customers/out' => 'customers#out', as: 'out'
  end
  namespace :admin do
    get 'homes/top'
    root to: 'homes#top'
    resources :genres
    resources :items
    resources :customers
    resources :orders
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
