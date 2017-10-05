$(document).ready ->
  $('.arrow-switch').click ->
    cur_v = $('#currency').val()
    cur_dest_v = $('#currency_destination').val()

    $('#currency').val(cur_v)
    $('#currency_destination').val(cur_dest_v)

  $('#quantity').keyup ->
    if $('#quantity').val().length > 0
      $('form').submit()

  $('#quantity').mouseup ->
    if $('#quantity').val().length > 0
      $('form').submit()

  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
