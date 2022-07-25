class WelcomeController < ApplicationController
    include HTTParty
  
    def search
      id = params[:id]
      response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{id}")
      render json: {pokemon_name: response['forms'][0]['name']}
    end
  
    def desactivate
      request_currencyapi = ENV['request_currencyapi'].to_i
      # request_currencyapi = ENV['request_currencyapi'].to_i*60
      DesactivateJob.perform_later(request_currencyapi, "Job_1")
      render json: {message: "que onda!"}
    end
  
    def api_buena
      render json: {message: "api_buena"}
    end
  
    def currencies
      p params['finit']
      p params['fend']
      # currency = Currency.where(currency: params['currency']).order(timestamp: :asc)
      # currency.last # Último
      # currency.first # Primero
      p (1..5)
      p params['currency']
      render json: {message: "currencies"}
    end
    
  end
  
  # Time.now().strftime('%FT%H:%M:%S')