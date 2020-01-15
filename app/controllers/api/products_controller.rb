class Api::ProductsController < ApplicationController
  def first_product
    @product = Product.first
    render "first_product.json.jb"
  end 

  def all_products
    @products = Product.all
    render "all_products.json.jb"
  end 
end




 