class CreateAthleteevents < ActiveRecord::Migration
  def change
    create_table :athleteevents do |t|

      t.timestamps null: false
    end
  end
end
