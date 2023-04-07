class Post < ApplicationRecord
  #in model, do your db connections
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maximum: 3000 }
  belongs_to :user
  #dependent destroy means that if you delete the post you delete all of the comments
  has_many :comments, dependent: :destroy
  #adding for noticed gem
  has_noticed_notifications model_name: 'Notification'
  #a post has many notifications, does it thru user model, and dependent destroy
  #∴ when user is deleted, the notifications will be as well
  has_many :notifications, through: :user, dependent: :destroy

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy 

  #fuck ransack this is getting annoying
  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end
end
