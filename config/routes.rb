Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"homes#top"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  #親子関係 ネストする
    resource :favorites, only: [:create, :destroy]
    # showページ不要でidの受け渡し不要のためidをリクエストに含めないresource
  end
  resources :users,only:[:show, :edit, :update]
end
