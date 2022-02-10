module Pokemons
  module V2
    class Client
      include HTTParty

      base_uri 'https://pokeapi.co/api/v2/'

      headers 'Content-Type' => 'application/json'
      headers 'Accept' => 'application/json'

      def get(api_path, query = {})
        self.class.get(api_path)
      end
    end
  end
end
