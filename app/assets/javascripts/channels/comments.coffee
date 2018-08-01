jQuery(document).on 'turbolinks:load', ->
  $comments = $('#comments')
  $new_comment_form = $('#new-comment')
  $new_comment_body = $new_comment_form.find('#comment-body')

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
          $new_comment_body.val('')
          $comments.prepend data['comment']
