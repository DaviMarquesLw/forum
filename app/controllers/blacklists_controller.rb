class BlacklistsController < ApplicationController
  before_action :set_blacklist, only: %i[show edit update]

  def new
    @blacklist = Blacklist.new
  end

  def show; end

  def index
    @blacklists = Blacklist.all
    @topics = Topic.all
  end

  def create
    @blacklist = Blacklist.new(blacklist_params)
    if @blacklist.save
      redirect_to blacklists_path
    else
      render :new
    end
  end

  def edit
    @blacklist = Blacklist.find(params[:id])
  end

  def update
    if @blacklist.update(blacklist_params)
      redirect_to blacklists_path
    else
      render :edit
    end
  end

  private

  def set_blacklist
    @blacklist = Blacklist.find(params[:id])
  end

  def blacklist_params
    params.require(:blacklist).permit(:word)
  end
end
