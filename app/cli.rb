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

  def user_input_team_info
    user_input = gets.chomp
    team = Team.all.select do |team|
      team.name == user_input
    end
    #binding.pry
    puts team.first.name
  end



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
        user_input_team_info
      end
    end
  end
end

#Enter a team name get get info on it has it won any world cups
#Enter a year returns information about that specific world cups
#Check out FAQ's and choose one to see the answer
