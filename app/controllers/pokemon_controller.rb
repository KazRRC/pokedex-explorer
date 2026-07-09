class PokemonController < ApplicationController
def index

  if params[:search].present?

    @pokemon = Pokemon
                  .where("name LIKE ?", "%#{params[:search]}%")
                  .order(:pokedex_number)

  else

    @pokemon = Pokemon.order(:pokedex_number)

  end

  @pokemon = @pokemon.page(params[:page]).per(20)

end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
