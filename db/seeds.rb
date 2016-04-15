User.create(username: "Peterrkang", email: "peterrkang@gmail.com", password_hash: "peter")
Post.create(content: "dont sweat it", user_id: 1)
User.create(username: "Kevin", email: "Kevin@aol.com", password_hash: "kevin")
Post.create(content: "hehhehehehe", user_id: 1)

15.times do |x|
  User.create(username: "user#{x}", email: "user#{x}@gmail.com", password_hash: "foobar#{x}")
end


user1 = User.first
user1.follow(User.find(2))
user1.follow(User.find(3))
user1.follow(User.find(4))
