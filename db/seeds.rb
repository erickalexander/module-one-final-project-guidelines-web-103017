require 'csv'
require 'pry'
require_relative '../config/environment'


adapter = CsvAdapter.new()

adapter.seed
