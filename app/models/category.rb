class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :comment_goal, dependent: :destroy

  validates :name, format: { with: /\./,
                               message: 'should include "."' }
  validates :name, format: { with: /\A[A-Z][a-z]+\s+[A-Z][a-z]+\.?\z/,
                               message: 'should have 2 capital words at least 2 characters' }
  validates :description, presence: true
end
