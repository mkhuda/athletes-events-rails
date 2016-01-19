class AthletesController < ApplicationController
	def index
		@athletes = Athlete.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@athlete = Athlete.new
	end

	def create
		@athlete = Athlete.create(athlete_params)
		if @athlete.save
	  		redirect_to athletes_path
	  	else
	  		render 'new'
	  	end
	end

	def destroy
		@athlete = Athlete.find(params[:id])
		@athlete.destroy

		redirect_to athletes_path
	end

	private
		def athlete_params
			params.require(:athlete).permit(:name, :birthday, :city, :province, :team_id, :number)
		end
end
