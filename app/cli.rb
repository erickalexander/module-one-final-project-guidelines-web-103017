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
    2) Look at FAQ's and get information from there."
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
    puts "#{team.first.name} has won #{championships.count} World Cup(s), in the year(s) #{championship_years}."
    puts "#{team.first.name} has hosted #{location.count} World Cup(s), in the year(s) #{location_years}."
  end

  def

  def start
    welcome
    img
    options
    input_option = gets.chomp
    if input_option == '1'
      teams_years
      puts"Choose the type of input you want team or year (A or B)"
      type_choice = gets.chomp
      if type_choice == 'A'
        puts "Enter a team name: "
        user_input = gets.chomp
        user_input_team(user_input)
      elsif type_choice == 'B'
        puts "Enter a year: "
        user_input = gets.chomp
        user_input_year(user_input)
      end

      end
    end
  end
end

#Enter a team name get get info on it has it won any world cups
#Enter a year returns information about that specific world cups
#Check out FAQ's and choose one to see the answer
