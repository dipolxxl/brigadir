Brigadir::Application.routes.draw do
  resources :brigades

  root to: 'brigades#index'
end
