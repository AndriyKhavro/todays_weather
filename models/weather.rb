require 'mongoid'
class Weather
  include Mongoid::Document

  field :day, type: Date, default: ->{ Date.today }
  field :main, type: String
  field :description, type: String
  field :clouds, type: Fixnum
  field :humidity, type: Fixnum
  field :pressure, type: Fixnum
  field :minTemp, type: Float
  field :maxTemp, type: Float

end