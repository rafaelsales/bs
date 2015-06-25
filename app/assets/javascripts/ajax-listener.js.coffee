$ ->
  $(document).on 'ajax:success', '[data-update-target]', (evt, data) ->
    targetSelector = $(this).data('update-target')
    $(targetSelector).html(data)

  $(document).on 'ajax:error', (evt, xhr, error) ->
    console.log(error)
