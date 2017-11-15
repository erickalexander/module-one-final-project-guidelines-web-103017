class CreatePlacements < ActiveRecord::Migration[5.1]
  def change
    create_table :placements do |t|
      t.integer :world_cup_id
      t.integer :team_id
      t.integer :placement
    end
  end
end
