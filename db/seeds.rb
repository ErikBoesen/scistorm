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


Community.create!(name: "Computer Science",
                  description: "A place for discussion of any and all topics related to Computer Science. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.",
                  photo: "http://i.imgur.com/1H9Ht5a.png",
                  created_at: Time.zone.now)

10.times do |n|
    Community.create!(name: "Community #{n}",
                      description: Faker::Lorem.sentence(25),
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
