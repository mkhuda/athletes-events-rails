class AddColumnToTeamevent < ActiveRecord::Migration
  def change
  	add_column :teamevents, :position, :integer
  	add_column :teamevents, :point, :integer
  end
end
