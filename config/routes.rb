Rails.application.routes.draw do
  mount Spree::Core::Engine, :at => '/'

  Spree::Core::Engine.routes.append do
    get '/contacts' => 'contacts#index', as: :contacts
  end
end
