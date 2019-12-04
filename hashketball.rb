def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
        ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  points = nil
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player_info|
      if player_info[:player_name] == player_name
        points = player_info[:points]
      end
    end
  end
  points
end

def shoe_size(player_name)
  size = nil
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player_info|
      if player_info[:player_name] == player_name
        size = player_info[:shoe]
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |team, team_info|
    if team_info[:team_name] == team_name
      colors = team_info[:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |team, team_info|
    teams.push(team_info[:team_name])
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, team_info|
    if team_info[:team_name] == team_name
      players = team_info[:players]
      players.each do |player_info|
        numbers.push(player_info[:number])
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player_info|
      if player_info[:player_name] == player_name
        player_info.delete(:player_name)
        stats = player_info
      end
    end
  end
  stats
end

def big_shoe_rebounds
  rebounds = nil
  biggest_shoes = 0
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player_info|
      if player_info[:shoe] > biggest_shoes
        biggest_shoes = player_info[:shoe]
        rebounds = player_info[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = nil
  points = 0
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player_info|
      if player_info[:points] > points
        points = player_info[:points]
        most_points = player_info[:player_name]
      end
    end
  end
  most_points
end

def winning_team
  winner = nil
  most_points = 0
  game_hash.each do |team, team_info|
    total = 0
    players = team_info[:players]
    players.each do |player_info|
      total += player_info[:points]
    end
    if total > most_points
      most_points = total
      winner = team_info[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  longest_name = nil
  longest_name_length = 0
  game_hash.each do |team, team_info|
    temp_name_length = 0
    players = team_info[:players]
    players.each do |player_info|
      temp_name_length = player_info[:player_name].length
      if temp_name_length > longest_name_length
        longest_name_length = temp_name_length
        longest_name = player_info[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_name = nil
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player_info|
      temp_steals = player_info[:steals]
      if temp_steals > most_steals
        most_steals = temp_steals
        most_steals_name = player_info[:player_name]
      end
    end
  end
  most_steals_name == player_with_longest_name
end