# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
  email: 'member@rocmetrics.com',
  password: 'helloworld',
  confirmed_at: '2016-09-05'
)

User.create!(
  email: 'user@gmail.com',
  password: 'helloworld',
  confirmed_at: '2016-09-05'
)
users = User.all

10.times do
  Application.create!(
  user: users.sample,
  name: Faker::Lorem.word,
  url: Faker::Internet.url
  )
end
applications = Application.all

10.times do
  Event.create!(
  application: applications.sample,
  name: 'session_start'
  )
end

10.times do
  Event.create!(
  application: applications.sample,
  name: 'tutorial_finished'
  )
end

10.times do
  Event.create!(
  application: applications.sample,
  name: 'Level_1_complete'
  )
end

10.times do
  Event.create!(
  application: applications.sample,
  name: 'session_end'
  )
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"
