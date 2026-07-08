class Pokemon < ApplicationRecord
  belongs_to :region

  has_many :pokemon_types, dependent: :destroy
  has_many :types, through: :pokemon_types

  has_many :pokemon_abilities, dependent: :destroy
  has_many :abilities, through: :pokemon_abilities

  validates :name, presence: true
  validates :pokedex_number, presence: true, uniqueness: true
  validates :height, presence: true
  validates :weight, presence: true
end