# frozen_string_literal: true

require "rails_helper"

RSpec.describe Discount, type: :model do
  fixtures :discounts

  let(:discount) { discounts(:discount_one) }

  describe "is_applicable?" do
    context "quantity is less than minimum quantity" do
      it "should return false" do
        expect(discount.is_applicable?(0)).to be_falsey
      end
    end

    context "quantity is equal to minimum quantity" do
      it "should return true" do
        expect(discount.is_applicable?(2)).to be_truthy
      end
    end

    context "quantity is greater than minimum quantity" do
      it "should return true" do
        expect(discount.is_applicable?(5)).to be_truthy
      end
    end
  end
end
