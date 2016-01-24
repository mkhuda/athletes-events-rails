class Athlete < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :team
	has_many :athleteevents
	has_many :events, through: :athleteevents
end
