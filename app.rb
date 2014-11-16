require 'sinatra'
require './config.rb'
require './models/weather.rb'


def initializeWeather
  weather = Weather.new(:main => "sunny", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1078, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save
  weather = Weather.new(:day => Date.today.next, :main => "cloudy", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1078, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save
  weather = Weather.new(:day => Date.today.next_day(2), :main => "sunny", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1078, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save
  weather = Weather.new(:day => Date.today.next_day(3), :main => "sunny", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1078, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save
  weather = Weather.new(:day => Date.today.next_day(4), :main => "sunny", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1078, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save
  weather = Weather.new(:day => Date.today.next_day(5), :main => "sunny", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1231, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save
  weather = Weather.new(:day => Date.today.next_day(6), :main => "sunny", :description => "fine weather", :clouds => 10,
                        :humidity => 60, :pressure => 1078, :minTemp => 12.28, :maxTemp => 14.88);
  weather.save

end

set port: 8002

before do
  initializeWeather if Weather.where(day: Date.today).count == 0;
end

get '/todays_weather.json' do
  content_type :json
  response['Access-Control-Allow-Origin'] = '*'
  Weather.where(day: Date.today).first.to_json
end