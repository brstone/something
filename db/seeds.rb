# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "test@test.com", password: "test123", password_confirmation: "test123")
User.create(email: "brittney@example.com", password: "test123", password_confirmation: "test123")

10.times do |x|
    Post.create(title: "Test #{x}", body: "IS THIS THING ON?", user_id: User.first.id) 
end