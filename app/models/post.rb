class Post < ApplicationRecord
  #in model, do your db connections
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maximum: 3000 }
  belongs_to :user
  #dependent destroy means that if you delete the post you delete all of the comments
  has_many :comments, dependent: :destroy
end
