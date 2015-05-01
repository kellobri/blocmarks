require 'faker'

admin = User.new(
	name: 'Admin Kelly',
	email: 'kellyobriant@gmail.com',
	password: 'blocparty'
	)
admin.save!

kellystandard = User.new(
	name: 'Standard Kelly',
	email: 'kobriant@gmu.edu',
	password: 'blocparty'
	)
kellystandard.save!

users = User.all

8.times do 
	Topic.create!(
		user: users.sample, 
		title: Faker::Lorem.word
	)
end
topics = Topic.all

32.times do 
	Bookmark.create!(
		topic: topics.sample,
		url: Faker::Internet.url
	)
end

puts "Seed finished"
puts "#{Topic.count} topics are now in the system."
puts "#{Bookmark.count} bookmarks have been seeded."
