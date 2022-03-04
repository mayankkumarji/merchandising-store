class Api::V1::ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    products = Product.all
    render json: products, status: 200
  end
end
