class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]

	def create

		user = User.find_by_email(params[:sender])
		if user.nil?
			user = User.new(:email => params[:sender], :name => 'New User', :password => 'password', :password_confirmation => 'password')
			user.save
		end
		
		topic = Topic.find_by_title(params[:subject])
		if topic.nil?
			topic = Topic.new(:title => params[:subject], :user => user)
			topic.save
		end

		url = params["body-plain"]
		bookmark = Bookmark.new(:topic_id => topic.id, :user_id => user.id, :url => url)

		bookmark.save

		puts "New bookmark created!"

		head 200
	end
end