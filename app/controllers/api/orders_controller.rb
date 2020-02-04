class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
      @orders = current_user.orders 
      render 'index.json.jb'
  end 

  def create 
    @order = Order.new(user_id: current_user.id)

    carted_products = current_user.cart
    subtotal_sum = 0

    carted_products.each do |carted_product|
      subtotal_sum += carted_product.product.price * carted_product.quantity
    end

    @order.subtotal = subtotal_sum
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax 

    @order.save
    render 'show.json.jb'
  end

  def show
    if current_user
      @order = Order.find(params[:id])
      render 'show.json.jb'
    else
      render json: {}
    end 
  end 
end
