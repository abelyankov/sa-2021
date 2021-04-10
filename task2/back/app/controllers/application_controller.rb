class ApplicationController < ActionController::Base

  def index
    render json: {message: "Uh uh back project"}, status: 200
  end

  def health
    render json: {status: "ok"}, status: 200
  end

  def students
    render json: {students: [{id: 1, name: "Test"}, {id: 2, name: "Test1"}]}, status: 200
  end

  def works
    render json: {works: [{id: 1, name: "Work1"}, {id: 2, name: "Work2"}]}, status: 200
  end
end
