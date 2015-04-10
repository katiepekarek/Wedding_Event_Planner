Rails.application.routes.draw do
  root 'welcome#index'
  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign_in' => 'authentications#new', as: :signin
  post '/sign_in' => 'authentications#create'
  get '/sign_out' => 'authentications#destroy', as: :signout

  resources :weddings do
    resources :events
  end

  resources :vendors do
    resources :budgets, except: [:index]
  end

  resources :budgets, only: [:index]

  resources :budgets, only:[] do
    resources :payments, except: [:show]
  end
end
