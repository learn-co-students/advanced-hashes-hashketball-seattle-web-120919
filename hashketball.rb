require 'pry'

def game_hash
  {
    home: {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: [
          {
              player_name:"Alan Anderson",
              number: 0,
              shoe: 16,
              points: 22,
              rebounds: 12,
              assists: 12,
              steals: 3,
              blocks: 1,
              slam_dunks: 1,
          }, {
              player_name: "Reggie Evans",
              number: 30,
              shoe: 14,
              points: 12,
              rebounds: 12,
              assists: 12,
              steals: 12,
              blocks: 12,
              slam_dunks: 7,
          }, {
              player_name: "Brook Lopez",
              number: 11,
              shoe: 17,
              points: 17,
              rebounds: 19,
              assists: 10,
              steals: 3,
              blocks: 1,
              slam_dunks: 15,
          }, {
              player_name: "Mason Plumlee",
              number: 1,
              shoe: 19,
              points: 26,
              rebounds: 11,
              assists: 6,
              steals: 3,
              blocks: 8,
              slam_dunks: 5,
          }, {       
              player_name: "Jason Terry",
              number: 31,
              shoe: 15,
              points: 19,
              rebounds: 2,
              assists: 2,
              steals: 4,
              blocks: 11,
              slam_dunks: 1,
        }
      ]
    },
    away: {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: [
            {
              player_name:"Jeff Adrien",
              number: 4,
              shoe: 18,
              points: 10,
              rebounds: 1,
              assists: 1,
              steals: 2,
              blocks: 7,
              slam_dunks: 2,
            }, {
              player_name: "Bismack Biyombo",
              number: 0,
              shoe: 16,
              points: 12,
              rebounds: 4,
              assists: 7,
              steals: 22,
              blocks: 15,
              slam_dunks: 10,
            }, {
              player_name: "DeSagna Diop",
              number: 2,
              shoe: 14,
              points: 24,
              rebounds: 12,
              assists: 12,
              steals: 4,
              blocks: 5,
              slam_dunks: 5,
            }, {
              player_name: "Ben Gordon",
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0,
            }, {       
              player_name: "Kemba Walker",
              number: 33,
              shoe: 15,
              points: 6,
              rebounds: 12,
              assists: 12,
              steals: 7,
              blocks: 5,
              slam_dunks: 12,
          }
        ]
      }
    }
end

#abstracting the code
def get_home_players
  game_hash[:home][:players]
end

def get_away_players
  game_hash[:away][:players]
end

def all_players
  get_home_players + get_away_players  
end

def select_player(player_name) #created healper method in order to located correct player
  all_players.find do |player|
    player[:player_name] == player_name
  end
end

def home_team_score
  points = 0
  get_home_players.select do |player|
    points += player[:points]
  end
  points
end

def away_team_score
  points = 0
  get_away_players.select do |player|
    points += player[:points]
  end
  points
end

# going to need to identify each players and display specfic information
# players points
def num_points_scored(player_name)
  select_player(player_name)[:points]
end

# use the same helper method in order to capture the player's shoe size
def shoe_size(player_name)
  select_player(player_name)[:shoe]
end

# in order to access the correct team we need to indentify the away/home team by searching the game_hash keys
# after create a condition that applies the correct team_name to the argument and return team colors
def team_colors(team_name)
  game_hash.keys.select do |team_key|
    if team_name == game_hash[team_key][:team_name]
      return game_hash[team_key][:colors]
    end
  end
end

# create a new array in order to push the team names / also can use map to further abstract this code
def team_names
  game_hash.keys.map do |team_key| 
    game_hash[team_key][:team_name]
  end
end

# compair the team name to the appropriate argument
# shovel applicable players into team array
def player_numbers(team_name)
  team_numbers = [ ]
  game_hash.keys.select do |team_key|
    if team_name == game_hash[team_key][:team_name]
      game_hash[team_key][:players].select do |players|
        team_numbers << players[:number]
        # binding.pry
      end
    end
  end
  team_numbers
end

# use the helper method that selects the specific person the user is looking for
# the helper method returns all the status inculding the player's name
# we need to use .delete_if in order to remove the key:value (player_name)--test whishes not to include this
# if the key is equal to player name then return all excluding key value pair of that condition
def player_stats(player_name)
  select_player(player_name).delete_if do |k,v|
    k == :player_name
  end
end

# identify the player with the biggest shoe size.
# using the helper method that "finds all players", loop through each player
# create a conditional to produce the rebounds of the player with the largest shoe size.
def big_shoe_rebounds
  shoe = 0
  rebound = 0
  all_players.select do |player|
    if player[:shoe] > shoe
      shoe = player[:shoe]
      rebound = player[:rebounds]
        # binding.pry
    end
  end
  rebound
end

# loop through all players in order to find the player with the most points
# use the all_players helper method in order loop though all the player easier
# return the player with the most points scored
def most_points_scored
  points = 0
  mvp = " "
  all_players.select do |player|
    if player[:points] > points
      points = player[:points]
      mvp = player[:player_name]
    end
  end
  mvp
end

# using two helper methods that produce the total points of each team
# we compare the two teams and set a contion to display the correct team with the most points
def winning_team
  if home_team_score > away_team_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

# loop through all players to identfy player's name; use the helper method all_players
# set a counter to check the length of the names
# return the name that is the longest.
def player_with_longest_name
  name_length = 0
  longest_name = " "
  all_players.select do |player|
    if player[:player_name].length > name_length
      name_length = player[:player_name].length
      longest_name = player[:player_name]
    end
  end
  longest_name
end

# loop through players to identify the player with the most steals
# compare the name of the player with the most steals to see if the player_with_longest_name is the player with the most steals
def long_name_steals_a_ton?
  steals = 0
  most_steals = " "
  all_players.select do |player|
    if player[:steals] > steals
      steals = player[:steals]
      most_steals = player[:player_name]
    elsif most_steals == player_with_longest_name
      return true
    end
  end
end