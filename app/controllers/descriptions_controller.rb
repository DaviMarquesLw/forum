class DescriptionsController < ApplicationController
  def index; end

  def new
    @description = Description.new
  end

  def create
    @description = Description.new(description_params)
    @description.topic_id = params[:topic_id]
    if @description.save
      redirect_to topic_path(params[:topic_id])
    else
      @topics = Topic.new
      render :new
    end
  end

  def show; end

  private

  def description_params
    params.require(:description).permit(:desc)
  end
end
