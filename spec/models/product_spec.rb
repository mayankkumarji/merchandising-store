# frozen_string_literal: true

require "rails_helper"

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  fixtures :products, :discounts

  let(:product) { products(:one) }

  describe "discounted_price" do
    context 'when discount is applicable' do
      it 'returns discounted price of the product' do
        discounted_price = product.discounted_price(3)
        expect(discounted_price).to eql(18.0)
      end
    end

    context 'when discount is not applicable' do
      it 'returns original price of the product' do
        discounted_price = product.discounted_price(1)
        expect(discounted_price).to eql(9.0)
      end
    end
  end
end
