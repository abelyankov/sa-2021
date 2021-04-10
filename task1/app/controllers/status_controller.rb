class StatusController < ApplicationController
  def index
  render json: {message: "Testing: #{request.host_with_port}"}
  end

  def health
    render json: {status: "OK"}
  end
end