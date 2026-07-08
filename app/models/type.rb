class Type < ApplicationRecord
  has_many :pokemon_types, dependent: :destroy
  has_many :pokemon, through: :pokemon_types

  validates :name, presence: true, uniqueness: true
end