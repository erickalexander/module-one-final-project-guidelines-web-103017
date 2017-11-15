require 'catpix'

class CLI

def welcome
  puts '                              ===================================================
                              Welcome to the FIFA World Cup Information Center
                              ==================================================='
end

def img
  Catpix::print_image "cup.png",
  :limit_x => 0.5,
  :limit_y => 0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => true,
  :resolution => "low"
end



def about
  puts 'I have the knowledge about all the World Cups
- In this application you will be able to learn more about the history
- Through an interactive environment I hope to answer FAQ\'s'

end


def start
  welcome
  img
  about

end

#Enter a team name get get info on it has it won any world cups
#Enter a year returns information about that specific world cups
#

end
