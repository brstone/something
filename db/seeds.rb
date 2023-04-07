
#User.create(email: "test@test.com", password: "test123", password_confirmation: "test123")
#User.create(email: "brittney@example.com", password: "test123", password_confirmation: "test123")

User.create(
    email: 'test@test.com',
    password: 'test123',
    password_confirmation: 'test123',
    name: "Test",
    role: User.roles[:admin])
User.create(
    email:'brittney@example.com',
    password: 'test123',
    password_confirmation: 'test123',
    name: "Brittney")
10.times do |x|
    post = Post.create(
            title: "Post #{x}",
            body: "IS THIS THING ON?!",
            user_id: User.first.id)
5.times do |y|
    Comment.create(
            body: "This is comment #{x}",
            user_id: User.second.id,
            post_id: post.id)
    end
end