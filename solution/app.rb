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
	@test = Todo.new(params[:toto])
	@test.save
	redirect "/"
end

delete "/:id" do
	@truc = Todo.find(params[:id])
	@truc.destroy
	redirect "/"
end

put "/:id" do
	@machin = Todo.find(params[:id])
	@machin.update(params[:machin])
	redirect "/"

end