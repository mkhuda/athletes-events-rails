class EventsController < ApplicationController

	before_filter :require_authorization
	
	def index
		@events = Event.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@event = Event.new
	end
	
	def create
		@event = Event.create(event_params)
		if @event.save
	  		redirect_to events_path
	  	else
	  		render 'new'
	  	end
	end
	
	def edit
		@event = Event.find(params[:id])
	end
	
	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
	  		redirect_to @event
	  	else
	  		render 'edit'
	  	end
	end
	
	def show
		@event = Event.find(params[:id])
	end
	
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end
	
	def require_authorization
		redirect_to root_path unless logged_in? # or whatever you want to check
	end
	
	private
		def event_params
			params.require(:event).permit(:name, :category, :city, :venue, :province, :startdate, :finishdate, :description, :price, :image)
		end
		
	
end
