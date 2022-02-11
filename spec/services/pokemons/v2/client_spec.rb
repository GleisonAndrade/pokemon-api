require 'rails_helper'

RSpec.describe Pokemons::V2::Client do
  let(:client) { described_class.new }

  context 'when pokemon name is valid ' do
    let(:abilities_response) do
      [
        {
          'ability' => {
            'name' => 'overgrow',
            'url' => 'https://pokeapi.co/api/v2/ability/65/'
          },
          'is_hidden' => false,
          'slot' => 1
        },
        {
          'ability' => {
            'name' => 'chlorophyll',
            'url' => 'https://pokeapi.co/api/v2/ability/34/'
          },
          'is_hidden' => true,
          'slot' => 3
        }
      ]
    end

    let!(:response) do
      VCR.use_cassette('pokeapi.co/api/v2/get/success') do
        client.get('/pokemon/bulbasaur')
      end
    end

    it 'returns http response' do
      expect(response).to be_kind_of(HTTParty::Response)
    end

    it 'returns success status code' do
      expect(response.parsed_response['abilities']).to eq(abilities_response)
      expect(response.code).to eq(200)
    end
  end

  context 'when pokemon name is invalid' do
    let!(:response) do
      VCR.use_cassette('pokeapi.co/api/v2/get/not_found') do
        client.get('/pokemon/non-existent')
      end
    end

    it 'returns http response' do
      expect(response).to be_kind_of(HTTParty::Response)
    end

    it 'returns not found status code' do
      expect(response.parsed_response).to eq('Not Found')
      expect(response.code).to eq(404)
    end
  end
end
