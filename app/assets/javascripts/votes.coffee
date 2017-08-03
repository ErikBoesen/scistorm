$(document).on 'ajax:success', 'a.vote', (status,data,xhr)->
  # update counter
  $(".vote-count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.vote[data-id=#{data.id}]").each ->
    $a = $(this)
    href = $a.attr 'href'
    text = $a.text()
    $a.text($a.data('toggle-text')).attr 'href', $a.data('toggle-href')
    $a.data('toggle-text', text).data 'toggle-href', href
    if `$a.hasClass('icon-star-empty')`
        $a.removeClass('icon-star-empty')
        $a.addClass('icon-star')
    else
        $a.removeClass('icon-star')
        $a.addClass('icon-star-empty')

    return

  return
