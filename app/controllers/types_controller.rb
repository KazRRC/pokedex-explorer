class TypesController < ApplicationController
  def index
    @types = Type.order(:name)
  end

  def show
    @type = Type.find(params[:id])
    @pokemon = @type.pokemon.order(:pokedex_number)
  end
end