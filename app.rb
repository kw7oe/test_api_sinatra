require "sinatra"
require "json"
require "sinatra/activerecord"
require "./environment"

class Person < ActiveRecord::Base

  def to_json
    { id: id, name: name, gender: gender, age: age }
  end

  def self.all_to_json
    { tasks: Person.all.map { |t| t.to_json } }
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

get "/api/people" do 
  content_type :json 
  @people = Person.all_to_json
  JSON(@people)
end

post "/api/people" do 
  @person = Person.create(name: params["name"], 
    gender: params["gender"],
    age: params["age"])
  if @person.save 
    succeed
  else
    failed
  end
end

