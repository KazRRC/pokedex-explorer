class RegionsController < ApplicationController
  def index
    @regions = Region.order(:name)
  end

  def show
    @region = Region.find(params[:id])
    @pokemon = @region.pokemon.order(:pokedex_number)
  end
end