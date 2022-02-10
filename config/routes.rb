Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    # Lista de habilidades em ordem alfabetica
    get '/pokemons/:pokemon_name', to: 'pokemons#show', constraints: { pokemon_name: /[A-Za-z ]+/ }
    # resources :pokemons, only: [:show], param: :pokemon_name
  end
end
