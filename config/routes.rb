Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: :cart_items_destroy_all
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm', as: :confirm_orders
    get 'orders/thanks' => 'orders#thanks', as: :thanks_orders
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
