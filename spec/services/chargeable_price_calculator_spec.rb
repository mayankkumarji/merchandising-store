# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChargeablePriceCalculator do
  fixtures :products

  let(:product_code1) { Product.first.code }
  let(:product_code2) { Product.last.code }

  describe "run" do
    context 'with valid product_list' do
      it 'returns total price of the products' do
        codes = [product_code1, product_code2]

        missing_codes, total_price = described_class.run(codes)

        expect(missing_codes).to eql([])
        expect(total_price).to eql(19.0)
      end
    end

    context 'with missing codes' do
      it 'returns missing codes array' do
        codes = [product_code1, "xyz"]

        missing_codes, total_price = described_class.run(codes)

        expect(missing_codes).to eql(["xyz"])
        expect(total_price).to eql(10.0)
      end
    end
  end
end
