class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_post#{params['post_id']}_category#{params['category_id']}_channel"
  end

  def unsubscribed
  end
end