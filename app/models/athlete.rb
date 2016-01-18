class Athlete < ActiveRecord::Base
	belongs_to :team
	has_many :events, through: :athleteevents
end
