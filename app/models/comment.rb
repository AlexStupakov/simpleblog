class Comment < ApplicationRecord
  belongs_to :comment_goal, polymorphic: true

  validates :author, format: { with: /\./,
                                message: 'should include "."' }
  validates :author, format: { with: /\A[A-Z][a-z]+\s+[A-Z][a-z]+\.?\z/,
                               message: 'should have 2 capital words at least 2 characters' }
  validates :content, presence: true

  scope :last_some, -> { order(created_at: :desc).limit(20) }

  after_create_commit :broadcast_message

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end
end
