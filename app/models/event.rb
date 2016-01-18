class Event < ActiveRecord::Base
	has_many :teamevents
	has_many :athleteevents
	has_many :athletes, through: :athleteevents
	has_many :team, through: :teamevents
end
