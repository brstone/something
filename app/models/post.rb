class Post < ApplicationRecord
  #in model, do your db connections
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maximum: 3000 }
end
