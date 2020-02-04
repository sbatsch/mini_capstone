class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    # @carted_product = CartedProduct.where(status: "carted", user_id: current_user.id)
    # @carted_products = current_user.carted_products.where(status: "carted")
    @carted_products = current_user.cart 
    render 'index.json.jb' 
    end
  end

  def create 
    @carted_product = CartedProduct.new(
                                        user_id: current_user.id, 
                                        product_id: params[:product_id,
                                        quantity: params[:quantity],
                                        status: "carted"
                                        )
    @carted_product.save
    render 'show.json.jb'
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status:"removed")
    render json: {message: 'This item is removed from your cart'}
  end
end
