class EventsController < ApplicationController

	before_filter :require_authorization

	add_breadcrumb "Home", :root_path
	add_breadcrumb "Events", :events_path
	
	def index
		@events = Event.paginate(:page => params[:page], :per_page => 20).where("category = ?", "Individual")
		@events_team = Event.paginate(:page => params[:page], :per_page => 20).where("category = ?", "Team")
	end

	def new
		@event = Event.new
		add_breadcrumb "Add New", new_event_path
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
		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Edit", edit_event_path(@event.id)
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
		
		if @event.category == 'Individual'
			@fetch = Athleteevent.all.where("event_id = ?", params[:id])
			
		else
			@fetch = Teamevent.all.where("event_id = ?", params[:id])
		end

		add_breadcrumb @event.name, event_path(@event.id)
	end

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

	def showathlete

		@event = Event.find(params[:event_id])
		@athlete = Athlete.paginate(:page => params[:page], :per_page => 10)

		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Add participants", ae_path(@event.id)
	end

	def showteam
		@event = Event.find(params[:event_id])
		@team = Team.paginate(:page => params[:page], :per_page => 10)

		add_breadcrumb @event.name, event_path(@event.id)
		add_breadcrumb "Add participants", at_path(@event.id)
	end

	def createathlete
		session[:return_to] ||= request.referer
		@tran = Athleteevent.new(ae_params)
		if @tran.save
			redirect_to session.delete(:return_to)
		end
	end

	def createteam
		session[:return_to] ||= request.referer
		@tran = Teamevent.new(at_params)
		if @tran.save
			redirect_to session.delete(:return_to)
		end
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

		def ae_params
			params.require(:ae).permit(:athlete_id, :event_id)
		end

		def at_params
			params.require(:at).permit(:team_id, :event_id)
		end
		
	
end
