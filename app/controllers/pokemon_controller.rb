class PokemonController < ApplicationController
def index
  @types = Type.order(:name)

  @pokemon = Pokemon.includes(:types, :region)
                    .order(:pokedex_number)

  if params[:search].present?
    @pokemon = @pokemon.where(
      "LOWER(name) LIKE ?",
      "%#{params[:search].downcase}%"
    )
  end

  if params[:type_id].present?
    @pokemon = @pokemon.joins(:types)
                       .where(types: { id: params[:type_id] })
  end

  @pokemon = @pokemon.distinct
                     .page(params[:page])
                     .per(20)
end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
