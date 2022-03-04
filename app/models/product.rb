class Product < ApplicationRecord
  validates :code, :name, :price, presence: true
  validates :code, uniqueness: true

  has_one :discount

  def discounted_price(quantity)
    return price * quantity unless discount&.is_applicable?(quantity)

    case discount.unit
    when "free_item"
      price * (quantity - discount.value)
    when "percentage"
      (price - (price * discount.value / 100)) * quantity
    end
  end
end
