class HomeController < ApplicationController
  def index
    @pokemon_count = Pokemon.count
    @type_count = Type.count
    @region_count = Region.count

    @featured_pokemon = Pokemon.order("RANDOM()").limit(3)
  end
end