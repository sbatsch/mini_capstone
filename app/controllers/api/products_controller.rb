class Api::ProductsController < ApplicationController
  def index
    @products = Product.all 

    search_term = params[:search]
    discount_option = params[:dsicount] == "true"
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    if search_term
      @products = Product.where("name iLIKE ?", "%#{ search_term }%")
    end 

    if discount_option
      @products = Product.all.where("price < ?", 10000)
    end 

    if sort_attribute == "price" && sort_order == "desc"
      @products = @products.order(price: :desc)
    elsif sort_attribute == "price"
      @products = @products.order(price: :asc)
    else 
      @products = @products.order(:id) 
    end 


    render 'index.json.jb'
  end 

  def create 
    @product = Product.new(name: params[:name],
                           price: params[:price],
                           description: params[:description],
                           supplier_id: params[:supplier_id]
                          )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end 

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

    if @product.save 
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Product sucessfully destroyed."}
  end
end