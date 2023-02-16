Rails.application.routes.draw do
 
root to: 'public/homes#top'

 
  namespace :public do
    resources :addresses
    get 'homes/top'
    #root to: 'homes#top'
    #root to: 'public/sessions#new'
    get 'homes/about'
    resources :customers
    get 'customers/quit'
    get 'customers/out'
  end
  namespace :admin do
    get 'homes/top'
    root to: 'homes#top'
  end
  namespace :admin do
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
