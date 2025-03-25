Rails.application.routes.draw do
  # Devise routes for authentication
  devise_for :users, controllers: { registrations: 'users/registrations' , sessions: 'users/sessions' }

  # Set root route
  root "home#index"

  # Public routes
  get "up" => "rails/health#show", as: :rails_health_check

  # Employee leave requests
  resources :leave_requests, only: [:new, :create, :show, :index]

  # HR namespace
  namespace :hr do
    resources :leave_requests, only: [:index, :update]

    resources :reports, only: [:index] do
      collection do
        get :export_my_approved_leaves_csv
        get :export_my_approved_leaves_pdf
      end
      member do
        get :export_employee_csv  
        get :export_employee_pdf
      end
    end
  end
end
