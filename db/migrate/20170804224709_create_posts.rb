class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.string :post_title
    	t.string :post_description
    	##add_reference :posts, :user, foreign_key: true
    	##add_reference :posts, :category, foreign_key: true
    	t.timestamps
    end
  end
end
