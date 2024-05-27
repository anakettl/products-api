class Product < ApplicationRecord
  validates :lm, :name, :free_shipping, :price, presence: true
end
