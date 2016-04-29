Rails.application.routes.draw do
  get '/contacts', to: 'contacts#index', as: :contacts

  mount Spree::Core::Engine, :at => '/'
end
