class Api::V1::ProductsController < Api::V1::BaseController
  # GET /products
  # GET /products.json
  def index
    products = Product.all
    render json: products, status: 200
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product, status: 200
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Strong permitted/whitelistd params
  def product_params
    params.require(:product).permit(:price)
  end
end
