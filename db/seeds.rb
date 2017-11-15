require 'csv'
require 'pry'
require_relative '../config/environment'

class ReadCsv
  def initialize(file = './world_cup.csv')
    @csv = CSV.new(File.read(File.join(File.dirname(__FILE__),"world_cup.csv")), headers: true)
  end

  def read
    @csv.map do |row|
      row = row.to_hash
      WorldCup.create({ year: row['YEAR'], location: row['LOCATION'] })
      Team.find_or_create_by({ name: row['LOCATION']})
      Team.find_or_create_by({ name: row['WINNER']})
      Team.find_or_create_by({ name: row['RUNNER_UP']})
      Team.find_or_create_by({ name: row['THIRD_PLACE']})
      Team.find_or_create_by({ name: row['FOURTH_PLACE']})
    end
  end
end

my_csv = ReadCsv.new('./world_cup.csv')

my_csv.read
