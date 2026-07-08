puts "Cleaning database..."

PokemonAbility.destroy_all
PokemonType.destroy_all
Pokemon.destroy_all
Ability.destroy_all
Type.destroy_all
Region.destroy_all

puts "Creating regions..."

kanto = Region.create!(
  name: "Kanto"
)

puts "Creating types..."

type_names = [
  "Normal",
  "Fire",
  "Water",
  "Electric",
  "Grass",
  "Ice",
  "Fighting",
  "Poison",
  "Ground",
  "Flying",
  "Psychic",
  "Bug",
  "Rock",
  "Ghost",
  "Dragon",
  "Dark",
  "Steel",
  "Fairy"
]

type_names.each do |name|
  Type.create!(name: name)
end

puts "Downloading Pokémon..."

(1..151).each do |id|
  pokemon_data = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{id}")
  pokemon = Pokemon.create!(
    name: pokemon_data["name"].capitalize,
    pokedex_number: pokemon_data["id"],
    height: pokemon_data["height"],
    weight: pokemon_data["weight"],
    sprite: pokemon_data["sprites"]["front_default"],
    region: kanto
  )
    pokemon_data["types"].each do |type_data|

    type = Type.find_by(
      name: type_data["type"]["name"].capitalize
    )

    PokemonType.create!(
      pokemon: pokemon,
      type: type
    )
  end
    pokemon_data["abilities"].each do |ability_data|

    ability = Ability.find_or_create_by!(
      name: ability_data["ability"]["name"].capitalize
    ) do |a|
      a.effect = "Imported from PokeAPI"
    end

    PokemonAbility.create!(
      pokemon: pokemon,
      ability: ability
    )

  end
end

puts "Done!"
puts "Pokemon: #{Pokemon.count}"
puts "Types: #{Type.count}"
puts "Abilities: #{Ability.count}"
