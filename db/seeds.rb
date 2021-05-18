# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    email: "anonymous@yopmail.com"
  )
end

8.times do
  event = Event.create!(
    start_date: Time.now + rand(2..25).days,
    duration: 25,
    title: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.paragraph_by_chars(number: 155),
    price: rand(1..1000),
    location: Faker::Address.city,
    administrator: User.all.sample
  )
end

15.times do
  attendance = Attendance.create!(
    event: Event.all.sample,
    attendee: User.all.sample
  )
end