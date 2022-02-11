require 'rails_helper'

RSpec.describe Pokemons::V2::GetAbilityService do
  context 'when pokemon name is valid ' do
    let(:content_response) { %w[chlorophyll overgrow] }

    let!(:response) do
      VCR.use_cassette('pokeapi.co/api/v2/get/success') do
        described_class.call('bulbasaur')
      end
    end

    it 'returns success status code' do
      expect(response[:content]).to eq(content_response)
      expect(response[:status]).to eq(200)
    end
  end

  context 'when pokemon name is invalid' do
    let!(:response) do
      VCR.use_cassette('pokeapi.co/api/v2/get/not_found') do
        described_class.call('non-existent')
      end
    end

    it 'returns not found status code' do
      expect(response[:status]).to eq(404)
      expect(response[:content]).to eq(error: 'Not Found')
    end
  end
end
