require 'csv'
require 'pry'
require_relative '../config/environment'

class ReadCsv
  def initialize(file = './world_cup.csv')
    @csv = CSV.new(File.read(File.join(File.dirname(__FILE__),"world_cup.csv")), headers: true)
  end

  def read
    @csv.map do |row|
      binding.pry
      row = row.to_hash
      WorldCupData.new({ year: row['YEAR'], location: row['LOCATION'], winner: row['WINNER'], runner_up: row['RUNNER_UP'],third_place: row['THIRD_PLACE'], fourth_place: row['FOURTH_PLACE'] })
    end
  end
end

my_csv = ReadCsv.new('./world_cup.csv')

my_csv.read
