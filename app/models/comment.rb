class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications 
  has_noticed_notifications model_name: 'Notification'

  private 

  def notify_recipient 
    #post.user since you want to deliver to user of post, otherwise
    #you would get your own notifications
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
    #same as notification.where(comment_id: comment.id)
    #found in noticed gem documentation as to how to name
    notifications_as_comment.destroy_all
  end
end
