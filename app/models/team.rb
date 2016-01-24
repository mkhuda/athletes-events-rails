class Team < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :athletes
	has_many :teamevents
	has_many :events, through: :teamevents
end
