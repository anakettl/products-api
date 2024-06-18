class Product < ApplicationRecord
  validates :lm, :name, :price, presence: true
  validates :lm, numericality: { only_integer: true }
end
