Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount API => '/'

  root 'boards#index'

  get :login, to: 'sessions#new'
  get :register, to: 'users#new'
end
