class Region < ApplicationRecord
  has_many :pokemon, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end