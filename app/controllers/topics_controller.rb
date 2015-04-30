class TopicsController < ApplicationController

	def index
		@topics = Topic.all
  end

  def new
  	@topic = Topic.new
  end

  def create
  	@topic = Topic.new(topic_params)
  	if @topic.save
  		redirect_to root_url, notice: "Your new Topic was saved successfully."
  	else
  		flash[:error] = "Error creating Topic. Please try again."
  		render :new
  	end
  end

  def topic_params
    params.require(:topic).permit(:title, :user)
  end

end