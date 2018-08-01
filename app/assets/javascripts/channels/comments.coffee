jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  console.log $messages
  $new_message_form = $('#new-message')
  console.log $new_message_form
  $new_message_body = $new_message_form.find('#message-body')
  console.log $new_message_body

  if $messages.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "CommentsChannel"
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if data['message']
          $messages.prepend data['message']

      send_message: (message) ->
        @perform 'speak', message: message
