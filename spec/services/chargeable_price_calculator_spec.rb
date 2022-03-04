# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChargeablePriceCalculator do
  fixtures :products, :discounts

  let(:product_code1) { products(:one).code }
  let(:product_code2) { products(:two).code }

  describe "run" do
    context 'with valid codes' do
      it 'returns total price of the products' do
        codes = [product_code1, product_code2]

        missing_codes, total_price = described_class.run(codes)

        expect(missing_codes).to eql([])
        expect(total_price).to eql(19.0)
      end
    end

    context 'with valid codes and discounts applicable' do
      it 'returns total discounted price of the products' do
        codes = [product_code1, product_code1, product_code2]

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
        expect(total_price).to eql(9.0)
      end
    end
  end
end
