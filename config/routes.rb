Rails.application.routes.draw do
  root 'welcome#index', as: :welcome
  get '/:id', controller: 'welcome', action: 'index'
  post 'welcome/shorten_url'
  post '/' , controller: 'welcome', action: 'shorten_url'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
