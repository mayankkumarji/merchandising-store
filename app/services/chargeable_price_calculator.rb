# frozen_string_literal: true

class ChargeablePriceCalculator
  attr_accessor :codes, :missing_codes

  def self.run(*args, &block)
    new(*args, &block).run
  end

  def initialize(codes)
    @codes = codes
    @missing_codes = []
  end

  def run
    total_price = 0.0

    codes.tally.each_pair do |code, quantity|
      next unless code.present?

      product = Product.find_by(code: code)

      missing_codes << code and next if product.blank?

      total_price += product.discounted_price(quantity)
    end

    [missing_codes, total_price]
  end
end
