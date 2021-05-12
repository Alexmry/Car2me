# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

BASE_URL =
5.times do
    User.create(
        email: Faker::Internet.email,
        password: Faker::Internet.username
    )
end
model_car = ['Toyota', 'BMW', 'Ferrari', 'Range Rover', 'Mini', 'Smart']
brand_car = ['DAF Car', 'Artega', 'Gaz Car', 'Polo', 'SIN Car', 'Tesla']
for i in 1..10
    Car.create(
        model: model_car.sample,
        brand: brand_car.sample,
        price: rand(50..200),
        user_id: i
    )
end
bools = [true, false]
for i in 0..10
    Booking.create(
        user_id: i,
        car_id: rand(0..10),
        confirmed: bools.sample
    )
end
