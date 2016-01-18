class CreateTeamevents < ActiveRecord::Migration
  def change
    create_table :teamevents do |t|

      t.timestamps null: false
    end
  end
end
