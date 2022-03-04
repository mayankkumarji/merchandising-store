class Api::V1::ProductsController < Api::V1::BaseController
  # GET /products
  # GET /products.json
  def index
    products = Product.all
    render json: products, status: :ok
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    product = Product.find(params[:id])
    if product.update(product_update_params)
      render json: product, status: :ok
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /products/chargeable_price
  # GET /products/chargeable_price.json
  def chargeable_price
    missing_codes, price = ChargeablePriceCalculator.run(chargeable_price_params[:codes])

    if missing_codes.present?
      errors = ["Could not find products for #{missing_codes.join(', ')}"]
      render json: { errors: errors }, status: :not_found
    else
      render json: { total: price }, status: :ok
    end
  end

  private

  # Strong permitted/whitelistd params
  def product_update_params
    params.require(:product).permit(:price)
  end

  def chargeable_price_params
    params.require(:products).permit(codes: [])
  end
end
