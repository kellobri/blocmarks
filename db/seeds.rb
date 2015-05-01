require 'faker'

admin = User.new(
	name: 'Admin Kelly',
	email: 'kellyobriant@gmail.com',
	password: 'blocparty'
	)
admin.skip_confirmation!
admin.save!

kellystandard = User.new(
	name: 'Standard Kelly',
	email: 'kobriant@gmu.edu',
	password: 'blocparty'
	)
kellystandard.skip_confirmation!
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
		user: users.sample,
		topic: topics.sample,
		url: Faker::Internet.url
	)
end

puts "Seed finished"
puts "#{Topic.count} topics are now in the system."
puts "#{Bookmark.count} bookmarks have been seeded."
