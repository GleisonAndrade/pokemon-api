class Api::PokemonsController < Api::ApplicationController

  # /api/v1/pokemons/:pokemon_name
  def show
    response = Pokemons::V2::GetAbilityService.call(permitted_params[:pokemon_name].strip)
    render json: response[:content], status: response[:status]
  end

  private

  def permitted_params
    params.permit(:pokemon_name)
  end
end
