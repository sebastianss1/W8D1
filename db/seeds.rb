# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

user1 = User.create!(username: "sebastian", password: "hello1234")
user2 = User.create!(username: "daniel", password: "hello1234")

sub1 = Sub.create!(title: "hello", description: "this is the first sub", user_id: user1.id)
sub2 = Sub.create!(title: "hello 2", description: "this is the second sub", user_id: user2.id)

post1= Post.create!(title: "this is a post", author_id: sub1.user_id)
post2= Post.create!(title: "this is another post", author_id: sub2.user_id)