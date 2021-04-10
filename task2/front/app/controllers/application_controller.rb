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
    http = get_http
    # @response = JSON.parse(http.request(Net::HTTP::Get.new("/studnets")).body)
  end

  def works
    http = get_http
    # @response = JSON.parse(http.request(Net::HTTP::Get.new("/works")).body)
  end

  private def get_http
    require 'net/http'
    require 'json'
  
    @host = '127.0.0.1'
    @port = '10001'
  
    @path = "/students"
    
    request = Net::HTTP::Get.new(@path, initheader = {'Content-Type' =>'application/json'})
    response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
    puts "Response #{response.code} #{response.message}: #{response.body}"
  end
end
