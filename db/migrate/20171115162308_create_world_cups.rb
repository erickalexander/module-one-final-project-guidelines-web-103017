class CreateWorldCups < ActiveRecord::Migration[5.1]
  def change
    create_table :world_cups do |t|
      t.integer :year
      t.text :location
    end
  end
end
