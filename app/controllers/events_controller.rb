class EventsController < ApplicationController

	before_filter :require_authorization

	add_breadcrumb "Home", :root_path
	add_breadcrumb "Events", :events_path
	
	#####
	##### view | form | show method
	#####
	
	# main index
	def index
		@events = Event.paginate(:page => params[:page], :per_page => 20).where("category = ?", "Individual")
		@events_team = Event.paginate(:page => params[:page], :per_page => 20).where("category = ?", "Team")
	end

	# create new event
	def new
		@event = Event.new
		add_breadcrumb "Add New", new_event_path
	end
	
	# edit event 
	def edit
		@event = Event.find(params[:id])
		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Edit", edit_event_path(@event.id)
	end
	
	# show result participants list
	def show
		@event = Event.find(params[:id])
		
		if @event.category == 'Individual'
			@fetch = Athleteevent.all.where("event_id = ?", params[:id])
			
		else
			@fetch = Teamevent.all.where("event_id = ?", params[:id])
		end

		add_breadcrumb @event.name, event_path(@event.id)
	end
	
	# show standing participants list
	def showstanding
		@event = Event.find(params[:event_id])
		
		if @event.category == 'Individual'
			@fetch = Athleteevent.all.where("event_id = ?", params[:event_id])
			
		else
			@fetch = Teamevent.all.where("event_id = ?", params[:event_id])
		end

		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Standings", standing_path(@event.id)
	end
	
	# show athlete list for creating participants
	def showathlete

		@event = Event.find(params[:event_id])
		@athlete = Athlete.paginate(:page => params[:page], :per_page => 10)

		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Add participants", ae_path(@event.id)
	end

	# show team list for creating participants
	def showteam
		@event = Event.find(params[:event_id])
		@team = Team.paginate(:page => params[:page], :per_page => 10)

		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Add participants", at_path(@event.id)
	end
	
	# set results event
	def setresults
		@event = Event.find(params[:event_id])
		
		if @event.category == 'Individual'
			@fetch = Athleteevent.all.where("event_id = ?", params[:event_id])
			@totalfetch = @fetch.count
		else
			@fetch = Teamevent.all.where("event_id = ?", params[:event_id])
			@totalfetch = @fetch.count
		end

		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Set Results", set_path(@event.id)
	end
	
	#####
	##### create, update, destroy by post | put | delete | edit method
	#####
	
	# create new event
	def create
		@event = Event.create(event_params)
		if @event.save
	  		redirect_to events_path
	  	else
	  		render 'new'
	  	end
	end
	
	# update event
	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
	  		redirect_to @event
	  	else
	  		render 'edit'
	  	end
	end
	
	# delete event
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end
	
	# create individual event
	def createathlete
		session[:return_to] ||= request.referer
		@tran = Athleteevent.new(ae_params)
		if @tran.save
			redirect_to session.delete(:return_to)
		end
	end
	
	# delete individual event
	def destroyathlete
		session[:return_to] ||= request.referer
		@tran = Athleteevent.find_by(ae_params)
		@tran.destroy
		redirect_to session.delete(:return_to)
	end

	# create team event
	def createteam
		session[:return_to] ||= request.referer
		@tran = Teamevent.new(at_params)
		if @tran.save
			redirect_to session.delete(:return_to)
		end
	end
	
	# delete team event
	def destroyteam
		session[:return_to] ||= request.referer
		@tran = Teamevent.find_by(at_params)
		@tran.destroy
		redirect_to session.delete(:return_to)
	end

	def require_authorization
		redirect_to root_path unless logged_in? # or whatever you want to check
	end
	
	private
		def event_params
			params.require(:event).permit(:name, :category, :city, :venue, :province, :startdate, :finishdate, :description, :price, :image)
		end

		def ae_params
			params.require(:ae).permit(:athlete_id, :event_id)
		end

		def at_params
			params.require(:at).permit(:team_id, :event_id)
		end
		
	
end
