Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #Pokemon
  get 'pokemons/:id' => 'welcome#search'
  get 'desactivate' => 'welcome#desactivate'
  get 'api_buena' => 'welcome#api_buena'
  get 'currencies/:currency' => 'welcome#currencies'
end
