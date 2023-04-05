# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

# we want to use this class to create a notification
class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
   deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
   def message
     @post = Post.find(params[:comment][:post_id])
     @comment = Comment.find(params[:comment][:id])
     @user = User.find(@comment.user_id)
     #the next line is being returned implicitly, don't need return keyword
     "#{@user.name} commented on #{@post.title.truncate(10)}"
   end
  #
   def url
    #a notification has a params column, then we're digging into the comment
    #hence the :comment, then we're getting the postid with :post_id
     post_path(Post.find(params[:comment][:post_id]))
   end
end
