4.times do |x|
  User.create(username: "user#{x}", email: "user@#{x}.com", password_hash: "t342ygdsjhj3214#{x}")
end


