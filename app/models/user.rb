class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Added bc of noticed gem to notify user of new comments
  has_many :notifications, as: :recipient, dependent: :destroy

  enum role: %i[user admin]
  #set_default_role is our method, new_record is from rails
  after_initialize :set_default_role, if: :new_record?

  private 

  def set_default_role
    self.role ||= :user
  end
end
