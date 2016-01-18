class AthletesController < ApplicationController
	def index
		@athletes = Athlete.paginate(:page => params[:page], :per_page => 20)
	end
end
