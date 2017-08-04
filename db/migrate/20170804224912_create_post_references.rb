class CreatePostReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :post_references do |t|
    	add_reference :posts, :user, foreign_key: true
    	add_reference :posts, :category, foreign_key: true
    end
  end
end
