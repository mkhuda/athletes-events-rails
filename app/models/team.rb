class Team < ActiveRecord::Base
	has_many :athletes
	has_many :events, through: :teamevents
end
