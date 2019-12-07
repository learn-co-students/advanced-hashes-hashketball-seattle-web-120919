# Alden Weaver

def game_hash()
  game =  {
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
        },
        { 
        :player_name => "Reggie Evans" ,
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        { 
        :player_name => "Brook Lopez" ,
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
                { 
        :player_name => "Mason Plumlee" ,
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        { 
        :player_name => "Jason Terry" ,
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        },
      ]
    },
    
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
        },
        { 
        :player_name => "Bismack Biyombo" ,
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },
        { 
        :player_name => "DeSagna Diop" ,
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
                { 
        :player_name => "Ben Gordon" ,
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        { 
        :player_name => "Kemba Walker" ,
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
        },
      ]
    }
  }
  
  return game
end

# iterates through home & away teams to access players
# hash then access a specific player
def get_player_info_by_name(team, name)
  game_hash[team][players][name]
end

def get_player_team_by_name(name)
  for each team in game_hash
    for each player in players
      if game_hash[team][players][name] != NIL
        return team
        
def get_team_by_name(name) 
  for each team in game_hash
  if team.name === name
    return team
end

def num_points_scored(player)
  team = get_player_team_by_name(player)
  get_player_info_by_name(team, player)
end

def shoe_size(player)
end 

def team_colors(team)
  team_hash = get_team_by_name(team)
  return team_hash[colors]
end

def team_names
  names = []
  for each team in game_hash
  names.push(team)
  return names  
end

def player_numbers(team)
  numbers = []
  team_hash = get_team_by_name(team)
  for each player in team_hash[players]
  numbers.push(player[number])
end

def player_stats(player)
  team = get_player_team_by_name(player)
  player_hash = get_player_info_by_name(team, player)
  return player_hash
end  

def big_shoe_rebounds
  # find player with largest shoe size
  largest_shoe = 0
  largest_player = ""
  for each team get players_hash
  for each player in [players_hash]
  if shoe_size(player) > largest_shoe
    largest_shoe = player.shoe_size
    largest_player = player
  
  # return that player's number of rebounds
  return largest_player[rebounds]
end

def most_points_scored
end
  
def winning_team
end 

def player_with_longest_name
end

def long_name_steals_a_ton?
end