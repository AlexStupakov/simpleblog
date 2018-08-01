jQuery(document).on 'turbolinks:load', ->
  $comments = $('#comments')

  if $comments.length > 0
    App.chat = App.cable.subscriptions.create {
        channel: "CommentsChannel",
        post_id: $comments.data('post-id'),
        category_id: $comments.data('category-id'),
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if data['comment']
          $new_comment_body = $('#comment-body')
          if $new_comment_body.val() == ''
            $comments.prepend data['comment']
          else
            $new_comment_body.val('')
