class Team < ActiveRecord::Base

  has_many :placements
  has_many :worldcups, through: :placements

  # def self.most_
  #   Team.where()
  # end

  def self.teams
    Team.all.collect do |team|
      puts "#{team.id} #{team.name}"
    end

  end

end
