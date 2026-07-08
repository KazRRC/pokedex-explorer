## Pokedex explorer

## Primary data source

the application imports Pokemon data from the public PokeAPI This API provides detailed information about pokemon including their names, pokedex numbers, height, weight, sprite images, abilities, and types

## Secondary data source

The faker gem will be used to generate additional sample data where appropriate, demonstrating the use of multiple data sources

## Database structure

The application consists of five tables:

pokemon
Type
region
ability
pokemonAbility

the pokemon table stores the primary pokemon information each pokemon belongs to one region, one pokemon can have one or many types, pokemon and abilities share a many to many relationship using the pokemonAbility join table
