class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    post_id = comment.comment_goal_id if comment.comment_goal_type == 'Post'
    category_id = comment.comment_goal_id if comment.comment_goal_type == 'Category'
    ActionCable.server.broadcast(
        "comments_post#{post_id}_category#{category_id}_channel",
        comment: render_comment(comment)
    )
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: {comment: comment}
  end
end