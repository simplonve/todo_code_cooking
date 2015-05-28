class CreateTodos < ActiveRecord::Migration
  def change
  	create_table :todos do |t|
  		t.text :task
  	end
  end
end
