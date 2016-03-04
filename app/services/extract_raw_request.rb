class ExtractRawRequest

  def initialize(raw_request)
    @raw_request = raw_request
    @request = {}
  end

  def extract
    raw_request.each { |k, v| request["#{k}"] = k }
    request
  end

  private

  attr_reader :raw_request, :request

end
