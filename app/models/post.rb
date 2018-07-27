class Post < ApplicationRecord
  mount_uploader :filename, AvatarUploader

  belongs_to :category
  has_many :comments, as: :comment_goal, dependent: :destroy

  validates :name, format: { with: /\./,
                             message: 'should include "."' }
  validates :name, format: { with: /\A[A-Z][a-z]+\s+[A-Z][a-z]+\.?\z/,
                             message: 'should have 2 capital words at least 2 characters' }
  validates :content, presence: true
  validates_size_of :filename, maximum: 2.megabytes, message: "should be less than 2MB"
end
