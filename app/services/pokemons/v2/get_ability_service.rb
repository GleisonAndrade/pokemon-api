module Pokemons
  module V2
    class GetAbilityService < ApplicationService
      attr_reader :pokemon_name
      attr_reader :client
  
      def initialize(pokemon_name, client = Client.new)
        @pokemon_name = pokemon_name
        @client = client
      end

      def call
        response = @client.get("/pokemon/#{pokemon_name}")

        if response.code == 200
          { status: 200, content: response.parsed_response['abilities'].map { |ability| ability['ability']['name'] }.sort }
        else
          { status: response.code, content: { error: response.parsed_response } }
        end
      end
    end
  end
end
