class Post < ApplicationRecord
	attr_accessor :name, :category_id
	belongs_to :user, optional: true
	belongs_to :category
end