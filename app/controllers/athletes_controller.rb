class AthletesController < ApplicationController
	before_filter :require_authorization

	add_breadcrumb "Home", :root_path
	add_breadcrumb "Athletes", :athletes_path
	def index
		@athletes = Athlete.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@athlete = Athlete.new
	end

	def create
		params[:athlete][:birthday] = params[:yyyy]+'/'+params[:mm]+'/'+params[:dd]
		@athlete = Athlete.create(athlete_params)
		if @athlete.save
	  		redirect_to athletes_path
	  	else
	  		render 'new'
	  	end
	end

	def show
		@athlete = Athlete.find(params[:id])
		add_breadcrumb @athlete.name, athlete_path(@athlete.id)
	end
	
	def edit
		@athlete = Athlete.find(params[:id])
		@gender = @athlete.gender
		@birthday = @athlete.birthday
		@themont = @birthday.strftime('%B')
	end

	def update
	    params[:athlete][:birthday] = params[:yyyy]+'/'+params[:mm]+'/'+params[:dd]
		@athlete = Athlete.find(params[:id])

		if @athlete.update(athlete_params)
			redirect_to @athlete
		else
			render 'edit'
		end

	end

	def destroy
		@athlete = Athlete.find(params[:id])
		@athlete.destroy

		redirect_to athletes_path
	end

	private
		def athlete_params
			params.require(:athlete).permit(:name, :birthday, :city, :province, :team_id, :number, :image, :address, :phone, :email, :gender)
		end

	def require_authorization
		redirect_to root_path unless logged_in? # or whatever you want to check
	end
end
