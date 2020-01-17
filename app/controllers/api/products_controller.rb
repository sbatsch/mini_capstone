class Api::ProductsController < ApplicationController
  def index
    @products = Product.all 
    render 'index.json.jb'
  end 

  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end 
end




 