class EventsController < ApplicationController

	before_filter :require_authorization
	
	def index
		@events = Event.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@event = Event.new
	end
	
	def create
		
	end
	
	def show
	
	end
	
	def require_authorization
		redirect_to root_path unless logged_in? # or whatever you want to check
	end
	
end
