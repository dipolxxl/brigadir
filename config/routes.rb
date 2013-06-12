Brigadir::Application.routes.draw do
  get 'tags/:tag', to: 'brigades#index', as: :tag
  resources :brigades

  root to: 'brigades#index'
end
