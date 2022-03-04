require 'rails_helper'

RSpec.describe Product, type: :request do
  fixtures :products

  describe 'GET /index' do
    before do
      get '/api/v1/products'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns proper records' do
      products = JSON.parse(response.body)

      expect(products.count).to eql(Product.all.count)
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'returns updated product price' do
        product = Product.first
        patch api_v1_product_path(id: product.id), params: { product: { price: 20 } }

        expect(response).to have_http_status(:success)
        expect(product.reload.price).to eql(20)
      end
    end

    context 'with invalid id' do
      it 'returns 404 http status' do
        patch api_v1_product_path(id: '123'), params: { product: { price: 20 } }

        expect(response).to have_http_status(404)
      end
    end

    context 'with invalid parameters' do
      it 'returns 422 http status' do
        patch api_v1_product_path(id: Product.first.id), params: {}

        expect(response).to have_http_status(422)
      end
    end
  end
end
