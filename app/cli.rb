require 'catpix'

class CLI

  def welcome
    puts '   ===================================================
     Welcome to the FIFA World Cup Information Center
     ==================================================='
     puts 'I have the knowledge about all the World Cups
   - In this application you will be able to learn more about the history
   - Through an interactive environment I hope to answer FAQ\'s'
  end

  def img
    Catpix::print_image "cup.png",
    :limit_x => 0.5,
    :limit_y => 0,
    :center_x => false,
    :center_y => false,
    :bg => "black",
    :bg_fill => true,
    :resolution => "low"
  end



  def teams_years
    team_group = "Group A #{Team.teams}"
    years_group = "Group B #{WorldCup.years}"
  end

  def options
    puts "What will you like to do?:
    1) Enter a team or year and get info on any of those.
    2) Look at FAQ's and get information from there.
    --- 'exit' to quit program ---"
  end

  def user_input_team_info(input)

    team = Team.all.select do |team|
      team.name == input
    end
    # binding.pry
    championships = team.first.placements.where(placement: 1)
    championship_years = championships.all.collect do |champ|
      champ.world_cup.year
    end
    location = WorldCup.all.select do |worldcup|
      worldcup.location == input
    end
    location_years = location.collect do |loc_year|
      loc_year.year
    end

    puts "You have choosen #{team.first.name}, below is some statistics of this team in the WorldCup"
    if championship_years.count > 0
      puts "#{team.first.name} has won #{championships.count} World Cup(s), in the year(s) #{championship_years}."
    else
      puts "#{team.first.name} has not won any world cups"
    end
    if location_years.count > 0
      puts "#{team.first.name} has hosted #{location.count} World Cup(s), in the year(s) #{location_years}."
    else
      puts "#{team.first.name} hasn't hosted any world cups."
    end
  end

  def user_input_year(input)
    wc_instance = WorldCup.all.select do |wc|
      wc.year == input.to_i
    end

    champion = wc_instance.first.placements.where(placement: 1).first.team.name
    second = wc_instance.first.placements.where(placement: 2).first.team.name
    third = wc_instance.first.placements.where(placement: 3).first.team.name
    fourth = wc_instance.first.placements.where(placement: 4).first.team.name
    # binding.pry
    puts "You have choosen the year #{wc_instance.first.year}, below you will find details of the World Cup of that year."
    puts "FIFA WORLD CUP #{wc_instance.first.year}
    + Location: #{wc_instance.first.location}
    + Winner: #{champion}
    + 2nd Place: #{second}
    + 3rd Place: #{third}
    + 4th Place: #{fourth}
    + Number of Teams: #{wc_instance.first.num_teams}
    + Total Goals Scored: #{wc_instance.first.goals}
    + Average Goals Per Game: #{wc_instance.first.average_goals_per_game}
    + Average Attendance Per Game: #{wc_instance.first.average_attendance_per_game}"
  end

  def faq
    puts "Here are some of the most common FAQs
    1) Who is the most recent world cup winner?
    2) Which country has the most World cup championships?
    3) Which world cup averaged the most attendance per game?
    4) Which country has made it to the top 4 the most?
    5) Where was the last world cup hosted?"
  end

  def recent_wc_winner
    wc_instance = WorldCup.all
    champion = wc_instance.first.placements.where(placement: 1).first.team.name
    puts "The most recent winner is #{champion}"
  end
  def most_wc_winner
    winners = Placement.all.where(placement: 1)
    hsh = winners.group(:team_id).count
    max_wc = winners.group(:team_id).count.values.max
    most_winner_id = hsh.key(max_wc)
    winner = Team.all.where(id: most_winner_id).first.name
    puts "The country with the most world cups is #{winner}, they have won #{max_wc}"
  end

  def most_wc_attendance

    group = WorldCup.all.group(:average_attendance_per_game)

    puts "#{group.last.location} averaged the most attendance per game, their average attendance was #{group.last.average_attendance_per_game}"

  end

  def most_playoffs
    hsh = Placement.all.group(:team_id).count
    max_playoff = hsh.values.max
    max_playoff_name_key = hsh.key(max_playoff)
    playoff_name_string = Team.all.where(id: max_playoff_name_key).first.name
    puts "The country that has made it to the top 4 the most is, #{playoff_name_string}, they made it #{max_playoff} times."
  end

  def last_host
    puts "#{WorldCup.first.location} hosted the most recent World Cup held in #{WorldCup.first.year}"
  end

  def ranking_info
    puts " -----------------------
    You can rank by the following:
    A) Most World Cup Championships
    B) Most World Cup Host
    C) Most World Cup Top 4"

  end


  def start
    welcome
    img

    loop do
      options
      input_option = gets.chomp
      if input_option == '1'
        teams_years
        puts"Choose the type of input you want team or year (A or B)"
        type_choice = gets.chomp
        puts "---------------------"
        puts "---------------------"
        if type_choice == 'A'
          puts "Enter a team name: "
          user_input = gets.chomp
          user_input_team_info(user_input)
        elsif type_choice == 'B'
          puts "Enter a year: "
          user_input = gets.chomp
          user_input_year(user_input)
        end
        puts "---------------------"
        puts "---------------------"
      elsif input_option == '2'
        faq
        user_input = gets.chomp
        puts "---------------------"
        puts "---------------------"
        if user_input == '1'
          recent_wc_winner
        elsif user_input == '2'
          most_wc_winner
        elsif user_input == '3'
          most_wc_attendance
        elsif user_input == '4'
          most_playoffs
        elsif user_input == '5'
          last_host
        end
        puts "---------------------"
        puts "---------------------"
      elsif input_option == 'exit'
        return puts "Goodbye come back soon to learn more about next years world cup"
      end
    end
  end
end

#Enter a team name get get info on it has it won any world cups
#Enter a year returns information about that specific world cups
#Check out FAQ's and choose one to see the answer
