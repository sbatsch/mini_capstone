class Api::CartedProductsController < ApplicationController

  def index
    if current_user
    @carted_products = CartedProduct.all
    @carted_products = @carted_products.where("status = ?", "carted")
    render 'index.json.jb' 
    end
  end

  def create 
    @carted_product = CartedProduct.new(
                                        user_id: current_user.id, 
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted"
                                        )
    @carted_product.save
    render 'show.json.jb'
  end
end
