# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username:'steven', password: 'pw123456', password_confirmation:'pw123456', email:'steven@example.com')
User.create!(username:'kb', password: 'pw123456', password_confirmation:'pw123456', email:'kb@example.com')
User.create!(username:'kristie', password: 'pw123456', password_confirmation:'pw123456', email:'kristie@example.com')

Restaurant.create!(creator: User.last, name: 'Chez Kristie ', cuisine: 'Modern American', address: '48 Wall St', city: 'New York', state: 'NY', zip:'10005' )
