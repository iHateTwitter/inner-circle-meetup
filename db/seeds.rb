# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  User.create(
    email: Faker::Internet.email,
    password: Devise.friendly_token[0, 20],
    name: Faker::Games::WorldOfWarcraft.hero,
    nickname: Faker::JapaneseMedia::SwordArtOnline.real_name,
  )
end

users = User.all.to_a

20.times do
  Meetup.create(
    host: users.sample,
    participants_limit: (5..20).to_a.sample,
    title: "냉무",
    description: "아무말아무말"
  )
end


meetups = Meetup.all.to_a

meetups.each do |meetup|
  sample_users = users.sample((3..users.size).to_a.sample)
  sample_users.each do |user|
    user.participate(meetup)
  end
end