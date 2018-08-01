class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments_channel"
  end

  def unsubscribed
  end

  def speak(data)
    p ["data",data]
    ActionCable.server.broadcast "comments_channel", message: data['message']
  end
end