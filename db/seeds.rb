User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

Exercise.create!(name: 'ball crunch', muscle: 'abs')
Exercise.create!(name: 'bicycle crunch', muscle: 'abs')
Exercise.create!(name: 'crunch twist', muscle: 'abs')
Exercise.create!(name: 'hanging knee raise', muscle: 'abs')
Exercise.create!(name: 'clap pushup', muscle: 'chest')
Exercise.create!(name: 'one-arm pushup', muscle: 'chest')
Exercise.create!(name: 'burpees', muscle: 'hips')
Exercise.create!(name: 'jumping lunge', muscle: 'hips')

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
