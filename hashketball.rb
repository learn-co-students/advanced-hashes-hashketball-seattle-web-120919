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

def player_stats(player_name)
  select_player(player_name).delete_if do |k,v|
    k == :player_name
  end
end


def big_shoe_rebounds
  counter = 0
  all_players.find do |player|
    if player[:shoe] >= 0
        binding.pry
  end
end




















































# def game_hash
#   {
#     :away => {:team_name => "Charlotte Hornets",
#               :colors => ["Turquoise", "Purple"],
#               :players => [
#                 {:player_name => "Jeff Adrien",
#                  :number => 4,
#                  :shoe => 18,
#                  :points => 10,
#                  :rebounds => 1,
#                  :assists => 1,
#                  :steals => 2,
#                  :blocks => 7,
#                  :slam_dunks => 2
#                 },
#                 {:player_name => "Bismack Biyombo",
#                  :number => 0,
#                  :shoe => 16,
#                  :points => 12,
#                  :rebounds => 4,
#                  :assists => 7,
#                  :steals => 22,
#                  :blocks => 15,
#                  :slam_dunks => 10
#                 },
#                 {:player_name => "DeSagna Diop",
#                  :number => 2,
#                  :shoe => 14,
#                  :points => 24,
#                  :rebounds => 12,
#                  :assists => 12,
#                  :steals => 4,
#                  :blocks => 5,
#                  :slam_dunks => 5
#                 },
#                 {:player_name => "Ben Gordon",
#                  :number => 8,
#                  :shoe => 15,
#                  :points => 33,
#                  :rebounds => 3,
#                  :assists => 2,
#                  :steals => 1,
#                  :blocks => 1,
#                  :slam_dunks => 0
#                 },
#                 {:player_name => "Kemba Walker",
#                  :number => 33,
#                  :shoe => 15,
#                  :points => 6,
#                  :rebounds => 12,
#                  :assists => 12,
#                  :steals => 7,
#                  :blocks => 5,
#                  :slam_dunks => 12
#                 }],
#               },
#     :home => {:team_name => "Brooklyn Nets",
#               :colors => ["Black", "White"],
#               :players => [
#                {:player_name => "Alan Anderson",
#                 :number => 0,
#                 :shoe => 16,
#                 :points => 22,
#                 :rebounds => 12,
#                 :assists => 12,
#                 :steals => 3,
#                 :blocks => 1,
#                 :slam_dunks => 1
#                },
#                {:player_name => "Reggie Evans",
#                 :number => 30,
#                 :shoe => 14,
#                 :points => 12,
#                 :rebounds => 12,
#                 :assists => 12,
#                 :steals => 12,
#                 :blocks => 12,
#                 :slam_dunks => 7
#                },
#                {:player_name => "Brook Lopez",
#                 :number => 11,
#                 :shoe => 17,
#                 :points => 17,
#                 :rebounds => 19,
#                 :assists => 10,
#                 :steals => 3,
#                 :blocks => 1,
#                 :slam_dunks => 15
#                },
#                {:player_name => "Mason Plumlee",
#                 :number => 1,
#                 :shoe => 19,
#                 :points => 26,
#                 :rebounds => 11,
#                 :assists => 6,
#                 :steals => 3,
#                 :blocks => 8,
#                 :slam_dunks => 5
#                },
#                {:player_name => "Jason Terry",
#                 :number => 31,
#                 :shoe => 15,
#                 :points => 19,
#                 :rebounds => 2,
#                 :assists => 2,
#                 :steals => 4,
#                 :blocks => 11,
#                 :slam_dunks => 1
#                }
#             ]
#           }
#   }
# end

# def num_points_scored(players_name)
#   game_hash.each do |place, team|
#     team.each do |attribute, data|
#       if attribute == :players
#         data.each do |player|
#           if player[:player_name] == players_name
#             return player[:points]
#           end
#         end
#       end
#     end
#   end
# end

# def shoe_size(players_name)
#   game_hash.each do |place, team|
#     team.each do |attribute, data|
#       if attribute == :players
#         data.each do |player|
#           if player[:player_name] == players_name
#             return player[:shoe]
#           end
#         end
#       end
#     end
#   end
# end

# def team_colors(team_name)
#   game_hash.each do |place, team|
#     if team[:team_name] == team_name
#        return team[:colors]
#     end
#   end
# end

# def team_names
#   game_hash.map do |place, team|
#     team[:team_name]
#   end
# end

# # def team_names
# #   array = []
# #   game_hash.each do |place, team|
# #     array << team[:team_name]
# #   end
# #   array
# # end

# def player_numbers(team_name)
#   nums = []
#   game_hash.each do |place, team|
#     if team[:team_name] == team_name
#       team.each do |attribute, data|
#         if attribute == :players
#           data.each do |player|
#             nums << player[:number]
#             binding.pry
#           end
#         end
#       end
#     end
#   end
#   nums
# end

# def player_stats(players_name)
#   new_hash ={}
#   game_hash.each do |place, team|
#     team.each do |attributes, data|
#       if attributes == :players
#         data.each do |player|
#           if player[:player_name] == players_name
#             new_hash = player.delete_if do |k,v|
#               k == :player_name
#             end
#           end
#         end
#       end
#     end
#   end
#   new_hash
# end

# def big_shoe_rebounds
#   big_shoe = 0
#   rebounds = 0
#   game_hash.each do |team, team_info|
#     team_info[:players].each do |player|
#       if player[:shoe] > big_shoe
#         big_shoe = player[:shoe]
#         rebounds = player[:rebounds]
#       end
#     end
#   end
#   return rebounds
# end

# def most_points_scored
#   most_points = 0
#   mvp = ''
#   game_hash.each do |home_away, keys|
#     keys[:players].each do |player|
#       points = player[:points]
#       if points > most_points
#         most_points = points
#         mvp = player[:player_name]
#       end
#     end
#   end
#   mvp
# end

# def winning_team
#   total_points = 0
#   win_team = ''
#   game_hash.each do |home_away, keys|
#     team_points = 0
#     team_name = game_hash[home_away][:team_name]
#     keys[:players].each do |player|
#       points = player[:points]
#       team_points += points
#     end
#       win_team, total_points = team_name, team_points if team_points > total_points
#   end
#   return win_team
# end

# def player_with_longest_name
#   longest = ''
#   longest_length = 0
#   game_hash.each do |home_away, keys|
#     keys[:players].each do |player|
#       name_length = player[:player_name].length
#       longest, longest_length = player[:player_name], name_length if name_length > longest_length
#     end
#   end
#   return longest
# end

# def long_name_steals_a_ton?
#   steals_most = ''
#   most_steals = 0
#   game_hash.each do |home_away, keys|
#     keys[:players].each do |player|
#       steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
#     end
#   end
#   return true if steals_most == player_with_longest_name
# end
