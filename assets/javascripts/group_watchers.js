$(function () {
  $('.group_for_watchers').insertAfter($('.search_for_watchers'))

  $(document).on('change', '.groups_label input', function () {
    $(this).parent().next().find(':checkbox')
      .prop('checked', $(this).prop('checked'))
  })
})
