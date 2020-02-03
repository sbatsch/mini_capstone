class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_many :carted_products

  has_many :products, through: :carted_products
  has_many :users, through: :carted_products


end
