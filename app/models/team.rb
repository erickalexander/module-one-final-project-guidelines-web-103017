class Team < ActiveRecord::Base

  has_many :placements
  has_many :world_cups, through: :placements

  # def self.most_
  #   Team.where()
  # end

  def self.teams
    tp Team.all, "name"
  end

end
