require 'pp'
require 'pry'

def game_hash 
  {
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien", 
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,	
          :assists => 1,
          :steals => 2,	
          :blocks => 7,	
          :slam_dunks => 2
        }, {
          :player_name => "Bismack Biyombo", 
          :number => 0,	
          :shoe => 16,
          :points => 12, 
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }, {
          :player_name => "DeSagna Diop", 
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12, 
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }, {
          :player_name => "Ben Gordon", 
          :number => 8,
          :shoe => 15,
          :points => 33, 
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }, {
          :player_name => "Kemba Walker", 
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    },
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson", 
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => "Reggie Evans", 
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => "Brook Lopez", 
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => "Mason Plumlee", 
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => "Jason Terry", 
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11, 
          :slam_dunks => 1
        }
      ]
    }
  }
end


def players #helper method
  get_all_players = game_hash[:home][:players] + game_hash[:away][:players]
  #binding.pry
  get_all_players #array of hashes of all players
  #binding.pry
end 

def teams #helper method
teams_array = []


teams_array << game_hash[:home]
teams_array << game_hash[:away]
teams_array
#binding.pry
end
# #   home_team = game_hash[:home]
# #   away_team = game_hash[:away]
# #   all_teams = home_team.merge(away_team)
# # binding.pry

# # get_teams = game_hash[:home] + game_hash[:away]
# # get_teams 
# #binding.pry

# end


# def stats
# stats = 
# end 

def num_points_scored(players_name)
  #binding.pry
  players.each do |player|
    if player[:player_name] == players_name
    return player[:points]
  #take in an argument of a players name and return the number of points scored for that player. 
# if players[:player_name] = players_name 
#   players[:points]
# end
    end
  end
end

def shoe_size(players_name)
  players.each do |player| 
    if player[:player_name] == players_name 
      return player[:shoe]
    end 
  end 
end
    
def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name 
    return team[:colors]
    end
  #binding.pry
#binding.pry
#   if key == team_name 
#     returns key[:colors]
#   end
# end
# end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |place, team|
    team_name_array << team[:team_name]
  end 
  team_name_array
  #binding.pry
end
  #operates on the game_hash to return an array of the team names. 

def player_numbers(team_name)
  jersey_array = []
  
  game_hash.each do |place, team| #binding.pry
    if team[:team_name] == team_name
     # binding.pry
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            jersey_array << player[:number]
            #binding.pry
          end
        end
      end 
    end
  end
  jersey_array
end
  #  team.select {|k,v| v == "Charlotte Hornets"}
  #  binding.pry

      
   # binding.pry
    # # team.each do |new_value, names| #binding.pry
    #if team[:team_name] == team_name
    #    # binding.pry
    #   jersey_array << team[:players][:number] #teams_name is the keys of team name, then colors, then players
 #names is name of the teams, then the colors of the teams, then the actual player info of the teams.
    
      #end
    


# jersey_array
#   end
        # if team[:team_name] == team_name 
        #   jersey_array << team[:players][:number]

    # if team[:team_name] == team_name 
    #   binding.pry
    #   jersey_array << team[:players][:number]
    # end
   # binding.pry

  def player_stats(players_name)
    stats_hash = {}
    game_hash.each do |place, team|
      team.each do |attributes, data|
        if attributes == :players 
          data.each do |player|
            if player[:player_name] == players_name
              player.delete(:player_name)
              stats_hash = player
            end
          end 
        end 
      end 
    end
    stats_hash
  end

  def big_shoe_rebounds
    # game_hash.values.each do |team|
    #   binding.pry
    #   team.each do |attributes, data| 
    #     binding.pry
    #     if attributes == :players 
    #       #binding.pry
    #      data.max_by{|k| k[:shoe]}[:rebounds]
    #       binding.pry
    #      #binding.pry
          
    #     end
    #   end
    # end

    players.max_by{|k| k[:shoe]}[:rebounds]

  end

  def most_points_scored
    players.max_by{|k| k[:points]}[:player_name]

  end

  def player_with_longest_name
    players.max_by{|k| k[:player_name].length}[:player_name]



  end

def winning_team 
    brooklyn_nets_total = 0
    charlotte_hornets_total = 0
  game_hash.each do |place, team|
    if team[:team_name] == "Charlotte Hornets"
      team[:players].each do |player| 
        charlotte_hornets_total += player[:points]
    end
    else 
      team[:players].each do |player| 
        brooklyn_nets_total += player[:points]
        #binding.pry
    end
    end 
  end
  if charlotte_hornets_total > brooklyn_nets_total
    return "Charlotte Hornets"
  else
    return "Brooklyn Nets"
  end
end



  def most_steals
    players.max_by{|k| k[:steals]}[:player_name]
  end

def long_name_steals_a_ton?
    if most_steals == player_with_longest_name
    return true 
    else 
    return false
    end
end
  
    
    #First, find the player with the largest shoe size
    #Then, return that player's number of rebounds
    #Remember to think about return values here.


    






#         #binding.pry
#     #   if new_value == team_name 
#     # return new_value[:colors] 

#     end 
#   end
# end
# end




  #   get_.each do |key, value|
  #     if [:players][:player_name] = players_name 
  #       [:players][:points]
  #     end
  #   end
  # end

