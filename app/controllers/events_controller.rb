class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, :only => [:show, :edit , :update, :destroy]

  def index
  	@events = Event.all
  end

  def new
    @event = Event.new
  end
 
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
 
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
  	@event.destroy
  	redirect_to events_path
  end

  private
  def find_event
  	@event = Event.find(params[:id])
  end

  def event_params
  	params.require(:event).permit!
  end
end