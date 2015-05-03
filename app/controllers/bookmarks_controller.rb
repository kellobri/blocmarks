class BookmarksController < ApplicationController

	def index
		@bookmarks = Bookmark.all
  end

  def new
  	@bookmark = Bookmark.new
  end

  def create
  	@bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
  	if @bookmark.save
  		redirect_to my_topics_path, notice: "Your new Bookmark was saved successfully."
  	else
  		flash[:error] = "Error creating bookmark. Please try again."
  		redirect_to my_topics_path
  	end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to my_topics_path, notice: "Bookmark was destroyed successfully."
    else
      flash[:error] = "There was an error in destoying this topic. Please try again."
      redirect_to my_topics_path
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:topic_id, :url, :user_id)
  end

end