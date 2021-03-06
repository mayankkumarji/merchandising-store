# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Product.create([{ code: 'MUG', name: 'Reedsy Mug', price: 6.00 },
                { code: 'TSHIRT', name: 'Reedsy T-shirt', price: 15.00 },
                { code: 'HOODIE', name: 'Reedsy Hoodie', price: 20.00 }])

product = Product.find_by(code: "MUG")
product.create_discount(unit: "free_item", value: 1, min_quantity: 2)

product = Product.find_by(code: "TSHIRT")
product.create_discount(unit: "percentage", value: 30, min_quantity: 3)
