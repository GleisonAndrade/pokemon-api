# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :request do
  describe 'GET /show' do
    context 'when pokemon name is valid' do
      let(:content_response) { %w[chlorophyll overgrow] }

      before(:all) do
        VCR.use_cassette('pokeapi.co/api/v2/get/success') do
          get '/api/pokemons/bulbasaur'
        end
      end

      it 'returns success status code' do
        expect(response.parsed_body).to eq(content_response)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when pokemon name is invalid' do
      before(:all) do
        VCR.use_cassette('pokeapi.co/api/v2/get/not_found') do
          get '/api/pokemons/non-existent'
        end
      end

      it 'returns not found status code' do
        expect(response.parsed_body).to eq('error' => 'Not Found')
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
