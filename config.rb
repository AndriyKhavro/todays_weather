require 'sinatra'
require 'mongoid'

configure do
  Mongoid.load!('./mongoid.yml')
end