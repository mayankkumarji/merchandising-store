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

  describe 'GET /chargeable_price' do
    context 'with valid codes' do
      let(:product_code1) { Product.first.code }
      let(:product_code2) { Product.last.code }

      it 'returns total price of the products' do
        params = { products: { codes: [product_code1, product_code2] } }

        get '/api/v1/products/chargeable_price', params: params

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['total']).to eql('19.0')
      end
    end

    context 'with missing codes' do
      it 'returns 404 http status' do
        get '/api/v1/products/chargeable_price', params: { products: { codes: ["xyz"] } }

        expect(response).to have_http_status(404)

        error = JSON.parse(response.body)['errors'].first
        expect(error).to eql('Could not find products for xyz')
      end
    end
  end
end
