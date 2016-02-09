# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username:'steven', password: 'pw123456', password_confirmation:'pw123456', email:'steven@example.com')

50.times do
  User.create!(username:Faker::Internet.user_name, email:Faker::Internet.safe_email, password: 'pw123456', password_confirmation:'pw123456')
end
users = User.all
cuisines = ['American', 'Thai', 'French', 'Italian', 'Japanese', 'Mexican', 'Spanish', 'Vietnamese', 'Chinese']

20.times do
  Restaurant.create!(
    name: Faker::Company.name,
    creator: users.sample,
    cuisine:cuisines.sample,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip
   )
end
restaurants = Restaurant.all
ratings = [1,2,3,4,5]

140.times do
  Review.create!(reviewer: users.sample, restaurant: restaurants.sample, rating: ratings.sample, body:Faker::Hipster.paragraph)
end
