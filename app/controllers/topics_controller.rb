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
    authorize @topic
  end

  def create
  	@topic = Topic.new(topic_params)
    authorize @topic
    @topic.user_id = current_user.id
  	if @topic.save
  		redirect_to my_topics_path, notice: "Your new Topic was saved successfully."
  	elsif Topic.friendly.find_by_title(@topic.title).nil? == false
      flash[:error] = "That Topic title already exists. You cannot create it again."
      redirect_to my_topics_path
    else
  		flash[:error] = "Error creating Topic. Please try again."
  		redirect_to my_topics_path
  	end
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @blocmarks = Bookmark.joins(:topic).where(topics: {title: @topic.title})
  end

  def destroy 
    @topic = Topic.friendly.find(params[:id])
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