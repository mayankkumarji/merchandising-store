class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :unit
      t.decimal :value
      t.integer :min_quantity
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
