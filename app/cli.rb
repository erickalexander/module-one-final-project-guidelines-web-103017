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
  Team.teams
end

def options
  puts "What will you like to do?:
  1) Enter a team or year and get info on any of those.
  2) Look at FAQ's and get information from there."

end


def start
  welcome
  img
  options
  teams_years


end

#Enter a team name get get info on it has it won any world cups
#Enter a year returns information about that specific world cups
#Check out FAQ's and choose one to see the answer


end
