# README

* Ruby Version 2.7.0

* Rails Version 6.1.4

#### Instructions

* Clone repo
* Install the bundle as `bundle install`
* Create the file `/config/database.yml` using `/config/database.example` to add the potgresql username and password, followed by creating the database using `rails db:create` and then migrating it using `rails db:migrate`
* Create the initial data by seeding as `rails db:seed`
* Start the rails server using `rails s`
* Run the test cases `bundle exec rspec `

##### Description

* Application for the merchandise store for the professionals
* It is comprised with 3 items
<table>
<tr>
<th bgcolor="white">Code</th>
<th bgcolor="white">Name</th>
<th bgcolor="white">Price</th>
</tr>
<tr>
<td bgcolor="white">MUG</td>
<td bgcolor="white">Reedsy Mug</td>
<td bgcolor="white">6.00€</td>
</tr>
<tr>
<td bgcolor="white">TSHIRT</td>
<td bgcolor="white">Reedsy T-shirt</td>
<td bgcolor="white">15.00€</td>
</tr>
<tr>
<td bgcolor="white">HOODIE</td>
<td bgcolor="white">Reedsy Hoodie</td>
<td bgcolor="white">20.00€</td>
</tr>
</table>
* Test cases management using Rspec library

It resolves the questions as below,
###### Que.1 Implement an API endpoint that allows listing the existing items in the store, as well as their attributes.
***Solution:*** Visiting `http://localhost:3000/api/v1/products` with `GET` request results out the JSON response by listing out the products with it's detail

###### Que.2 Implement an API endpoint that allows updating the price of a given product.
***Solution:*** Visiting `http://localhost:3000/api/v1/products/1` with `PATCH` request to update the price (for ex. first product with id=1) with params as `{ product: { price: 20 } }`, results out the JSON response of the products with it's updated price

###### Que.3 Implement an API endpoint that allows one to check the price of a given list of items.
***Solution:*** Visiting `http://localhost:3000/api/v1/products/chargeable_price` with `GET` request with params as `{ products: { codes: ['MUG', 'TSHIRT'] } }`, results out the JSON response for the total price of the products.

###### Que.4 For expansion of the store to provide some discounted prices in some situations as below,
- 2-for-1 (buy two, one of them is free) for the `MUG` item; (Discount type = 0) => Singular Discount
- 30% discounts on all `TSHIRT` items when buying 3 or more. (Discount type = 1) => Multiple Discount

***Solution:*** After modification over the same endpoint as in the Que.3 which is `http://localhost:3000/api/v1/products/chargeable_price` with `GET` request with params as `{ products: { codes: ['MUG', 'MUG', 'TSHIRT'] } }`, results out the JSON response for the total with discounted price of the products
