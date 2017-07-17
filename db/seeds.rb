# Users
User.create!(name:  "Example User",
             username: "example",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             #admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               username: "example#{n}",
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Posts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


99.times do |n|
    Community.create!(name: "Community #{n}",
                      created_at: Time.zone.now)
end

users = User.order(:created_at).take(5)
communities = Community.order(:created_at).take(5)

communities.each { |community|
    users.each {
        content = Faker::Lorem.sentence(5)
        users.each { |user| community.posts.create!(user_id: user.id, content: content) }
    }
}
