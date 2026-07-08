class Ability < ApplicationRecord
  has_many :pokemon_abilities, dependent: :destroy
  has_many :pokemon, through: :pokemon_abilities

  validates :name, presence: true, uniqueness: true
end