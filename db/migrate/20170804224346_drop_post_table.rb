class DropPostTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :posts_tables
  end
end
