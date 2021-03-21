Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shorts, except: %i[index destroy]
  root to: 'shorts#new'
  get '/stats', to: "shorts#index"
end
