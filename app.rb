require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './environments'

enable :sessions

class Todo < ActiveRecord::Base
end

get "/" do
  @todo = Todo.all
  erb :todo
end

post "/" do
  @todos = Todo.new(params[:todos])
  if @todos.save
    redirect "/", :notice => 'New task added!'
  else
    redirect "/", :error => 'Something went wrong. Try again.'
  end
end

put "/:id" do
  @todos = Todo.find(params[:id])
  @todos.update_attributes(params[:todos])
  redirect "/"
end

delete "/:id" do
  @todos = Todo.find(params[:id])
  @todos.destroy
  redirect "/"
end
