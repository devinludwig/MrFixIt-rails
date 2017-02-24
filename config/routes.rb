Rails.application.routes.draw do
  devise_for :workers
  devise_for :users
  root 'landing#index'

  resources :jobs
  resources :workers

  patch '/progress_update/:id', to: 'jobs#update_progress', as: 'job_update'

end
