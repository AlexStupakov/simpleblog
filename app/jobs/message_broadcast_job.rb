class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'comments_channel', message: render_message(message)
  end

  private

  def render_message(message)
    CommentsController.render partial: 'comments/comment', locals: {comment: message}
  end
end