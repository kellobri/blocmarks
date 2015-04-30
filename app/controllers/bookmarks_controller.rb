class BookmarksController < ApplicationController

	def index
		@bookmarks = Bookmark.all
  end

  def new
  	@bookmark = Bookmark.new
  end

  def create
  	@bookmark = Bookmark.new(bookmark_params)
  	if @bookmark.save
  		redirect_to root_url, notice: "Your new Bookmark was saved successfully."
  	else
  		flash[:error] = "Error creating bookmark. Please try again."
  		render :new
  	end
  end

  def bookmark_params
    params.require(:bookmark).permit(:topic, :url)
  end

end