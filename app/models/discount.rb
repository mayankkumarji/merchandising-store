class Discount < ApplicationRecord
  validates :unit, :value, :min_quantity, presence: true
  validates :unit, inclusion: { in: %w(free_item percentage) }

  belongs_to :product

  def is_applicable?(quantity)
    quantity >= min_quantity
  end
end
