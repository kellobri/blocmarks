class LikesController < ApplicationController

	def create
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.build(bookmark: @bookmark)

		if like.save
			redirect_to topics_path, notice: "Your have added a new blocmark to your collection."
		else
			redirect_to topics_path, notice: "There was an error in adding that blocmark to your collection. Please try again."
		end
	end

	def destroy
		@bookmark = Bookmark.find(params[:bookmark_id])
		@like = current_user.likes.find(params[:id])

		if like.destroy
			redirect_to my_topics_path, notice: "Your have removed this blocmark to your collection."
		else
			redirect_to my_topics_path, notice: "There was an error in removing that blocmark from your collection. Please try again."
		end
	end
end
