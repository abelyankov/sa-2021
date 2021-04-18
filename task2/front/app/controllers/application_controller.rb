class ApplicationController < ActionController::Base
  require 'net/http'
  require 'uri'
  def index
    render json: {status: 200, message: "Uh uh front"}, status: 200
  end
  
  def health
    render json: {status: 200, message: "OK"}, status: 200
  end

  def students
    response = get_http("students")
    @response = JSON.parse(response.body)
  end

  def works
    response = get_http("works")
    @response = JSON.parse(response.body)
  end

  private def get_http(path)
    require 'net/http'
    require 'json'
  
    @host = '127.0.0.1'
    @port = '10001'
  
    @path = path
    
    request = Net::HTTP::Get.new(@path, initheader = {'Content-Type' =>'application/json'})
    response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
  end
end
