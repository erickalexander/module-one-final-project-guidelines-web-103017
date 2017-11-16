class CreateWorldCups < ActiveRecord::Migration[5.1]
  def change
    create_table :world_cups do |t|
      t.integer :year
      t.text :location
      t.integer :num_teams
      t.integer :num_matches
      t.integer :goals
      t.float :average_goals_per_game
      t.integer :average_attendance_per_game
    end
  end
end
