class Team < ActiveRecord::Base

  has_many :placements
  has_many :worldcups, through: :placements

  # def self.most_wins
  #   Team.where()
  # end

end
