require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Todo < ActiveRecord::Base
end

get "/" do
  @todos = Todo.all
  erb :todo
end

post "/" do
  @todos = Todo.new(params[:todos])
  @todos.save
  redirect "/"
end

put "/:id" do
  @todos = Todo.find(params[:id])
  @todos.update(params[:todos])
  redirect "/"
end

delete "/:id" do
  @todos = Todo.find(params[:id])
  @todos.destroy
  redirect "/"
end
