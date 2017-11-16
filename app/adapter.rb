class CsvAdapter
  def initialize()
    @csv = CSV.new(File.read(File.join(File.dirname(__FILE__),"../db/world_cup.csv")), headers: true)
  end

  def seed
    @csv.map do |row|
      row = row.to_hash
      wc = WorldCup.create({ year: row['YEAR'], location: row['LOCATION'], num_teams: row['TEAMS'], num_matches: row['MATCHES'] , goals: row['GOALS'] , average_goals_per_game: row['AVERAGE_GOALS'] , average_attendance_per_game: row['AVERAGE_ATTENDANCE'] })
      Team.find_or_create_by({ name: row['LOCATION']})
      winner = Team.find_or_create_by({ name: row['WINNER']})
      second = Team.find_or_create_by({ name: row['RUNNER_UP']})
      third = Team.find_or_create_by({ name: row['THIRD_PLACE']})
      fourth = Team.find_or_create_by({ name: row['FOURTH_PLACE']})
      Placement.create({world_cup_id: wc.id, team_id: winner.id, placement: 1})
      Placement.create({world_cup_id: wc.id, team_id: second.id, placement: 2})
      Placement.create({world_cup_id: wc.id, team_id: third.id, placement: 3})
      Placement.create({world_cup_id: wc.id, team_id: fourth.id, placement: 4})

    end
  end
end
