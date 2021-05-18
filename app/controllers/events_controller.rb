class EventsController < ApplicationController

  # before_action :authenticate_user!

  def index
    @events = Event.all
  end
  
  def new
  end

  # def create
  #   @event = Event.new(
  #     'title' => params[:title],
  #     'content' => params[:content]
  #   )
  #   @event.user = User.find_by(id: session[:user_id])
  #   @event.user = current_user
  #   if @event.save
  #     flash[:success] = "We saved your event!"
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  # def update
  #   @event = Event.find(params[:id])
  #   gossip_params = params.require(:gossip).permit(:title, :content)
  #   if @event.update(gossip_params)
  #     redirect_to @event
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to @event
  end
end
