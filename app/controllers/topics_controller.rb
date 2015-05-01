class TopicsController < ApplicationController

	def index
		@topics = Topic.all
  end

  def personal
    @topics = Topic.all
    #@topics = Topic.joins(:user).where({user_id: current_user})
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

  def show
    @topic = Topic.find(params[:id])
    @blocmarks = Bookmark.joins(:topic).where(topics: {title: @topic.title})
  end

  def destroy 
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to topics_path, notice: "Topic was destroyed successfully."
    else
      flash[:error] = "There was an error in destoying this topic. Please try again."
      render :show
    end
  end
  
  private

  def topic_params
    params.require(:topic).permit(:title, :user)
  end

end