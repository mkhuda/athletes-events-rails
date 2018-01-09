class TeamsController < ApplicationController
	
  before_filter :require_authorization
	add_breadcrumb "Home", :root_path
	add_breadcrumb "Teams", :teams_path

	def index
		@teams = Team.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@team = Team.new
	end

	def create
		params[:team][:birthday] = params[:yyyy]+'/'+params[:mm]+'/'+params[:dd]
		@team = Team.create(team_params)
		if @team.save
	  		redirect_to teams_path
	  	else
	  		render 'new'
	  	end
	end
	
	def edit
		@team = Team.find(params[:id])
		@team.birthday? ? (@birthday = DateTime.now.beginning_of_day) : (@birthday = @team.birthday)
	end

	def update
	    params[:team][:birthday] = params[:yyyy]+'/'+params[:mm]+'/'+params[:dd]
		@team = Team.find(params[:id])

		if @team.update(team_params)
			redirect_to @team
		else
			render 'edit'
		end

	end

	def show
		@team = Team.find(params[:id])
		@size = @team.athletes.size
		add_breadcrumb @team.name, team_path(@team.id)
	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		redirect_to teams_path
	end

	private
		def team_params
			params.require(:team).permit(:name, :birthday, :city, :address, :image, :address, :phone, :email, :website, :leader)
		end

	def require_authorization
		redirect_to root_path unless logged_in? # or whatever you want to check
	end

end
