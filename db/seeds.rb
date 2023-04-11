
#User.create(email: "test@test.com", password: "test123", password_confirmation: "test123")
#User.create(email: "brittney@example.com", password: "test123", password_confirmation: "test123")

User.create(
    email: 'test@test.com',
    password: 'test123',
    password_confirmation: 'test123',
    name: 'Test',
    role: User.roles[:admin])
User.create(
    email:'brittney@example.com',
    password: 'test123',
    password_confirmation: 'test123',
    name: 'Brittney')


elapsed = Benchmark.measure do 
  posts = []
  test1 = User.first 
  brittney = User.second
  100.times do |x|
    puts "creating post #{x}"
    post = Post.new(
            title: "Post #{x}",
            body: "IS THIS THING ON?!",
            user: test1)
  2.times do |y|
    puts "Creating comment #{y} for post #{x}"
    post.comments.build(
            body: "This is comment #{x}",
            user_id: brittney)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true) 
end


puts "elapsed time is #{elapsed.real} seconds"