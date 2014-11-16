require 'sinatra'

set port: 8001

get '/' do
  erb :weatherview, layout:false
end