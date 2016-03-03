jQuery(document).ready(function() {
  var trapId = gon.trap_id;
  var eventSourcePath = '/watch_requests/' + trapId;
  var source = new EventSource(eventSourcePath);
  source.addEventListener('update',function(e){
    $('#requests').prepend(e.data);
  },false);
});
