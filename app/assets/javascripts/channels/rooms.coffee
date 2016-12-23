jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        if data['del_message']
          messages.children().filter((e) ->
            parseInt(@dataset.messageId) == data['del_message'].id
          ).remove()
        else
          messages.append data['message']
          messages_to_bottom()

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

      delete_message: (message_id) ->
        @perform 'delete_message', message_id: message_id

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false

    $(document).on 'click', '.delete_message', (e) ->
      e.preventDefault()
      messageId = this.dataset.messageId
      App.global_chat.delete_message messageId
      return
