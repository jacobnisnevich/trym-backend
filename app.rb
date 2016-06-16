require 'sinatra'
require 'json'

require File.expand_path('../lib/trym.rb', __FILE__)

get '/' do
  ''
end

post "/login" do 
  user = User.new
  user.login_user(params[:email], params[:password])
end

post "/register" do 
  user = User.new
  user.resgister_user(params[:email], params[:password], params[:first_name], params[:last_name])
end
