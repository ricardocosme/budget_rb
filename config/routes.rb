Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "months#index"
  resources :months do
    resources :incomes
    resources :categories do
      resources :expenses
    end
  end
end
