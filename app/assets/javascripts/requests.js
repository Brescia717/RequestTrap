$(document).ready(function() {
  var $rr = $('#raw-response');
  $('#raw-response-btn').on('click', function() {
    if (!$rr.hasClass('show-me')) {
      $rr.addClass('show-me');
      $rr.css({'visibility': 'visible'});
    } else {
      $rr.removeClass('show-me');
      $rr.css({'visibility': 'hidden'});
    }
  });
});
