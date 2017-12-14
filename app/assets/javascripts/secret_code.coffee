ready = undefined

ready = ->
  $('.save').on 'click', () ->
    $('#secretModal').modal('hide');
    $("#frmSecret").submit();
    return

$(document).ready ready