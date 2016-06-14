# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(username: "Robbie", password: "password")
user2 = User.create(username: "Bob", password: "password")

category1 = Category.create(name: "Cutting")
category2 = Category.create(name: "Painting")
category3 = Category.create(name: "Shaping")

user1.tools.create(name: "Hammer", price: 10.99, quantity: 3, category_id: category3.id)
user1.tools.create(name: "Coping Saw", price: 15.99, quantity: 2, category_id: category1.id)

user2.tools.create(name: "Tennon Saw", price: 50.99, quantity: 1, category_id: category1.id)
user2.tools.create(name: "Roller", price: 4.99, quantity: 5, category_id: category2.id)
