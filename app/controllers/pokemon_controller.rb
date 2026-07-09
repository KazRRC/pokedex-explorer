class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.order(:pokedex_number)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end