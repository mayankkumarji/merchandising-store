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
end
