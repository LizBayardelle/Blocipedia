require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Superhero.name
  )
end
users = User.all

100.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Book.title,
    body: Faker::Hipster.paragraphs(3)
  )
end

puts "Seed finished!"
puts "#{User.count} users created!"
puts "#{Wiki.count} wikis created!"
