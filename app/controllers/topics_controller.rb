class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @blacklists = Blacklist.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @descriptions = Description.where(topic: @topic)
    @blacklists = Blacklist.all
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
