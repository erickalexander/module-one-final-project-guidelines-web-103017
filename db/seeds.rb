require 'csv'
require 'pry'
require_relative '../config/environment'

class ReadCsv
  def initialize(file = './world_cup.csv')
    @csv = CSV.new(File.read(file), headers: true)
  end

  def read
    @csv.map do |row|
      row = row.to_hash
      binding.pry
      WorldCupData.new({ year: row['YEAR'], location: row['LOCATION'], winner: row['WINNER'], runner_up: row['RUNNER_UP'],third_place: row['THIRD_PLACE'], fourth_place: row['FOURTH_PLACE'] })
    end
  end
end

my_csv = ReadCsv.new('./world_cup.csv')

my_csv.read
