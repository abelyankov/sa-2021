Rails.application.routes.draw do
    get '/' => "application#index"
    get '/health' => "application#health"
    get '/students' => "application#students"
    get '/works' => "application#works"
end
