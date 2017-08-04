class Create < ActiveRecord::Migration[5.1]
  def change
  	create_table :categories do |t|
  		t.string :category_title
  		t.string :category_description
  	end
  end
end
