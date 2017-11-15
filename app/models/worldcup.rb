class WorldCup < ActiveRecord::Base
  has_many :placements
  has_many :teams, through: :placements


end
