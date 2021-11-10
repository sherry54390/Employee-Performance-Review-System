Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'sign_up', to: 'home#new'
  post 'sign_up', to: 'home#create'
  get 'survey_forms/new' => 'survey_forms#new', as: 'new_survey'
  post 'survey_forms/new' => 'survey_forms#create', as: 'create_survey'
  resources :survey_forms
  get 'edit', to: 'home#edit'
  post 'edit', to: 'home#update'
  resources :home
  #get 'managers' => 'home/roles' , as: 'view_manager'
  #get 'fill_form' ,to: 'survey_forms#fill_form/:id', as: 'fill_form'
  #get 'survey_form/fill_form/:id', to: 'survey_forms#fill_form', as: 'fill_form'
end
