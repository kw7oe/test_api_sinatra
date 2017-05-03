require "sinatra"
require "json"
require "sinatra/activerecord"
require "net/http"
require "./environment"

class Person < ActiveRecord::Base

  def to_json
    { id: id, name: name, gender: gender, age: age }
  end

  def self.all_to_json
    { people: Person.all.map { |t| t.to_json } }
  end
end

helpers do
  def succeed
    JSON({response: "Succeed"})
  end

  def failed 
    JSON({response: "Failed"})
  end

  def error(e)
    JSON({error: e})
  end
end

get "/weather/:location" do 
  content_type :json
  headers 'Access-Control-Allow-Origin' => 'https://kw7oe.github.io'
  params[:location]
  base_url =  "http://api.openweathermap.org/data/2.5/weather?q=";
  end_point = "&APPID=" + ENV['WEATHER_API_KEY'];
  uri = URI(base_url + params['location'] +end_point)
  res = Net::HTTP.get_response(uri).body
  puts res
  res
end

get "/api/people" do 
  content_type :json 
  @people = Person.all_to_json
  JSON(@people)
end

post "/api/people" do 
  @person = Person.create(
    name: params["name"], 
    gender: params["gender"],
    age: params["age"]
  )
  if @person.save 
    succeed
  else
    failed
  end
end

