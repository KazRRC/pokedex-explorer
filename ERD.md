# Pokédex Explorer ERD

```text
                Region
              ----------
              id
              name
                  |
                  | 1
                  |
                  | *
              Pokemon
--------------------------------
id
name
pokedex_number
height
weight
sprite
type_id
region_id
                  |
                  | *
                  |
                  | *
          PokemonAbility
----------------------------
id
pokemon_id
ability_id
                  |
                  | *
                  |
                  | 1
              Ability
----------------------------
id
name
effect

Pokemon also belongs to one Type.

Type
------------
id
name
```