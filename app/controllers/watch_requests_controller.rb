require 'reloader/sse'

class WatchRequestsController < ApplicationController
  include ActionController::Live

  def show
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      Request.watch_new_requests(trap_id) do |request_id|
        sse.write "event: update\n"
        sse.write "data: #{request_html(request_id)}\n\n"
      end
    rescue IOError
    ensure
      sse.close
    end
  end

  private

  def trap_id
    params[:id]
  end

  def request_html(request_id)
    request_obj = Request.find(request_id)
    html = render_to_string(
      :partial => "requests/request",
      :formats => [ :html ],
      :locals => { :request => request_obj})
      
    html.gsub(/ *\n+/,'')
  end
end
