# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Booking.destroy_all if Rails.env.development?
Car.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
puts 'seeding database'

emails = ['p@gmail.com', 'j@gmail.com', 'a@gmail.com', 'f@gmail.com']
passwords = ['p12345', 'j12345', 'a12345', 'f12345']
names = ['pierre', 'jonas', 'alex', 'felix']
addresses = ['bordeaux', 'lille', 'lyon', 'paris']

model_car = ['Toyota', 'BMW', 'Ferrari', 'Range Rover', 'Mini', 'Smart']
brand_car = ['DAF Car', 'Artega', 'Gaz Car', 'Polo', 'SIN Car', 'Tesla']
cloudinary_url = [
    'https://images.unsplash.com/photo-1493238792000-8113da705763?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1493238792000-8113da705763?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    'https://images.unsplash.com/photo-1493238792000-8113da705763?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'
  ]
avatar_url = "https://res.cloudinary.com/alexmry/image/upload/v1620146216/samples/bike.jpg"

puts "creating user"

def image_fetcher(url)
  URI.open(url)
end

for i in 0..3
    User.create(
        email: emails[i],
        password: passwords[i],
        name: names[i]
    )
end

puts "setting photo for user"
users_id = []
users = User.all
users.each do |user|
    users_id << user.id
    photo = image_fetcher(avatar_url)
    user.photo.attach({io: photo,filename: "#{user.id}_image.jpg"})
end

puts "creating car"
for i in 0..2
    Car.create(
        model: model_car.sample,
        brand: brand_car.sample,
        price: rand(50..200),
        user_id: users_id.sample,
        address: addresses[i]
    )
end

cars_id = []
cars = Car.all
for i in 0..2
    cars_id << cars[i].id
    photo = image_fetcher(cloudinary_url[i])
    print photo
    cars[i].photos.attach({io: photo, filename: "#{cars[i].id}_image.jpg"})
end

puts "creating bookings"
5.times do
    Booking.create(
        user_id: users_id.sample,
        car_id: cars_id.sample,
        confirmed: nil,
        starts_at: "2021-05-09",
        ends_at: "2021-05-12"
    )
end

bookings_id = []
bookings = Booking.all
bookings.each do |booking|
    bookings_id << booking.id
end

puts 'creating reviews'
10.times do
    Review.create(
        booking_id: bookings_id.sample,
        rating: rand(1..5),
        content: Faker::Movie.quote
    )
end

puts "end of seed"
