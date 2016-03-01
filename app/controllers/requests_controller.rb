class RequestsController < ApplicationController
  helper_method :trap_id, :filtered_requests

  def index
  end

  def create
    NewRequest.new(trap_id, request, response).create
    head 200, content_type: 'text/html'
  end

  def show
    @request = filtered_requests.find(params[:id])
  end

  private

  def trap_id
    @trap_id = params[:trap_id]
  end

  def filtered_requests
    @requests = Request.where(trap_id: trap_id)
  end

end
