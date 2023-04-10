
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

posts = []
comments = []

elapsed = Benchmark.measure do 
  100.times do |x|
    puts "creating post #{x}"
    post = Post.new(
            title: "Post #{x}",
            body: "IS THIS THING ON?!",
            user_id: User.first.id)
    posts.push(post)
  2.times do |y|
    puts "Creating comment #{y} for post #{x}"
    comment = post.comments.new(
            body: "This is comment #{x}",
            user_id: User.second.id,
            post_id: post.id)
    comments.push(comment)
    end
  end
end

Post.import(posts)
Comment.import(comments)

puts "elapsed time is #{elapsed.real} seconds"