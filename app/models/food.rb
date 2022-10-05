class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods
  has_many :recipes, through: :recipe_foods
end
