class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods
  has_many :foods, through: :recipe_foods
end
