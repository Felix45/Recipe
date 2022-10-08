class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
