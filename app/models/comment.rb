class Comment < ApplicationRecord
  belongs_to :comment_goal, polymorphic: true

  # validates_presence_of :content
  # validates_format_of :author,
  #                     with: /\A[A-Z][a-z]+\s+[A-Z][a-z]+\z/,
  #                     message: "should have 2 capitalized words"
  validates :author, inclusion: { in: %w(.),
                                message: "%{value} is not a valid size" }
  validates :author, format: { with: /\A[A-Z][a-z]+\s+[A-Z][a-z]+\z/,
                               message: "should have 2 capitalized words" }
  validates :content, presence: true
end
