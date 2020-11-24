# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Outfit.destroy_all
User.destroy_all

User.create!(last_name: "Kap", first_name: "Kelly", password: 123456, email: "dghj@jkhdj.com")
User.create!(last_name: "Sonnenberg", first_name: "Hanna", password: 345677, email: "abl@hshjnn.com")

SIZES = ["xs", "s", "m", "l", "xl"]

User.all.each do |user|
  3.times do
    Outfit.create(
    name: "Witch",
    size: SIZES.sample,
    gender: "female",
    price: rand(10..50),
    category: "halloween",
    location: "amsterdam",
    start_date: Date.new(2020,5,23),
    end_date: Date.new(2020,5,24),
    user: user
    )
  end
end


puts "#{Outfit.count} new outfits created"
puts "#{User.count} new user created"

