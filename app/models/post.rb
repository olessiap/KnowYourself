class Post < ApplicationRecord
	attr_accessor :name, :category_id
	has_attached_file :image, styles: { small: "150x150", medium: "300x300", large: "600x600" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	belongs_to :user, optional: true
	belongs_to :category
	validates_presence_of :post_title, length: { minimum: 1 }
	validates_presence_of :post_description, length: { minimum: 10 }

end