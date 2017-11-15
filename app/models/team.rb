class Team < ActiveRecord::Base

  has_many :placements
  has_many :worldcups, through: :placements

end
