# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#posts = Post.create([{post_title: "post1", post_description: "lalallalalalla", user_id: "1", category_id: "1"}, {post_title: "post2", post_description: "lalallalalalla", user_id: "1", category_id: "1"}])


#categories = Category.create([{category_title: "great sharks" }, {category_title: "Amazing Falafels"} ])


Category.create!([{category_title: "Special Events"},
		{category_title: "Around The World"},
		{category_title: "Amazing Falafels"},
		{category_title: "Relationships"},
		{category_title: "family"}
		])

User.create!(email: o@dd.com, password:"123456")

5.times do |i|
	Post.create!(
		post_title:Faker::Beer.name,
		post_description:Faker::Hipster.paragraphs,
		user_id: "1",
		category_id: Category.first.id
		#image_file_name: File.open(Rails.root, "/public/seed/#{file_name}.jpg")
		)
end