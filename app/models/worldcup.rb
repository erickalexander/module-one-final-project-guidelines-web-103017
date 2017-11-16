require 'pry'

class WorldCup < ActiveRecord::Base
  has_many :placements
  has_many :teams, through: :placements

  def self.years
    # WorldCup.all.collect do |wc|
    #   puts "#{wc.year}"
    # end
    tp WorldCup.all, "year"
  end


end
