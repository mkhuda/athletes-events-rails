class AddColumnToAthleteevent < ActiveRecord::Migration
  def change
  	add_column :athleteevents, :position, :integer
  	add_column :athleteevents, :point, :integer
  end
end
