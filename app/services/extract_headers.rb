class ExtractHeaders

  def initialize(request_headers)
    @request_headers = request_headers
    @headers = {}
  end

  def extract
    headers['REQUEST_METHOD']  = request_headers['REQUEST_METHOD']
    headers['REQUEST_URI']     = request_headers['REQUEST_URI']
    headers['SERVER_PROTOCOL'] = request_headers['SERVER_PROTOCOL']
    headers['HOST']            = request_headers['HTTP_HOST']
    headers['USER_AGENT']      = request_headers['HTTP_USER_AGENT']
    headers['ACCEPT']          = request_headers['HTTP_ACCEPT']
    headers['ACCEPT_LANGUAGE'] = request_headers['HTTP_ACCEPT_LANGUAGE']
    headers['ACCEPT_ENCODING'] = request_headers['HTTP_ACCEPT_ENCODING']
    headers['CONNECTION']      = request_headers['HTTP_CONNECTION']
    headers['CONTENT_TYPE']    = request_headers['Content-Type']

    headers
  end

  private

  attr_reader :request_headers, :headers

end
