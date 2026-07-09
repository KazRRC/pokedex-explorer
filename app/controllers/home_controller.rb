class HomeController < ApplicationController
  def index
    @pokemon_count = Pokemon.count
    @type_count = Type.count
    @ability_count = Ability.count
  end
end