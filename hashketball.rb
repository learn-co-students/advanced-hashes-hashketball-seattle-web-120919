def game_hash
  teams = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [      
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}
        ]
    }
  }
end   

def num_points_scored(ptosearch)
  teams = game_hash
  #p teams[:home][:players]
  teams.each_pair do |hoa, teaminfo|
    #p hoa
    teaminfo[:players].each do |playerindex|
      if playerindex.has_value?(ptosearch)
        puts "found #{ptosearch} #{playerindex[:points]}"
        return playerindex[:points]
      end 
    end  
  end 
end   

def player_stats(ptosearch)
  teams = game_hash
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].each do |playerindex|
      if playerindex.has_value?(ptosearch)
      ptosearch = playerindex
      ptosearch.delete(:player_name)
      return ptosearch
      end 
    end 
  end
end   

def shoe_size(ptosearch)
  player_stats(ptosearch)[:shoe]
end   

def team_colors(ttosearch)
  teams = game_hash
  teams.each_pair do |hoa, teaminfo|
    if teaminfo.has_value?(ttosearch)
      ttosearch = teaminfo[:colors]
      return ttosearch
    end   
  end 
end  

def team_names
  teams = game_hash
  teamarr = []
  teams.each_pair do |hoa, teaminfo|
    teamarr.push(teaminfo[:team_name])
  end 
  teamarr
end   

def player_numbers(ttosearch) 
  teams = game_hash
  teamnums = []
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].each do |playerindex|
      playerindex.each_pair do |key, value|
        if teaminfo.has_value?(ttosearch) && !teamnums.include?(playerindex[:number])
          puts "#{ttosearch}#{playerindex[:number]}"
          teamnums.push(playerindex[:number])
        end 
      end   
    end   
  end 
  p teamnums  
end   

def big_shoe_rebounds
  teams = game_hash
  playerarr = []
  biggestshoe = {:shoe => 0} 
  
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].each do |playerindex|
      playerarr.push(playerindex)
    end 
  end 
  
  playerarr.each do |pstats|
    #puts "#{pstats[:player_name]} shoe #{pstats[:shoe]} rebounds #{pstats[:rebounds]}" 
    if biggestshoe[:shoe] < pstats[:shoe]
      biggestshoe = pstats
    end   
  end   
  
  biggestshoe[:rebounds]
end   

def most_points_scored
  teams = game_hash
  playerarr = []
  mostpoints = {:points => 0} 
  
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].each do |playerindex|
      playerarr.push(playerindex)
    end 
  end 
  
  playerarr.each do |pstats|
    if mostpoints[:points] < pstats[:points]
      mostpoints = pstats
    end   
  end   
  mostpoints[:player_name]
end 

def winning_team
  teams = game_hash
  mostpoints = {} 
  
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].reduce(nil) do |memo, playerindex|
      p "#{teaminfo[:team_name]}#{playerindex[:points]}"
      if !memo 
        memo = playerindex[:points]
      else 
        memo = memo + playerindex[:points]
      end   
      mostpoints[teaminfo[:team_name]] = memo 
      memo
    end 
  end 
  
  sortedpoints = mostpoints.sort_by do |k, v|
    -v
  end 
  
  sortedpoints[0][0]
end 

def player_with_longest_name
  teams = game_hash
  playerarr = []
  longestn = nil
  
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].each do |playerindex|
      playerarr.push(playerindex)
    end 
  end 
  
  playerarr.each do |pstats|
    if (!longestn)||(longestn.length < pstats[:player_name].length)
      p "longername found"
      longestn = pstats[:player_name]
    end   
   p "#{pstats[:player_name]}#{pstats[:player_name].length}"
  end   
  longestn
end

def long_name_steals_a_ton?
  teams = game_hash
  playerarr = []
  moststeals = {:steals => 0} 
  
  teams.each_pair do |hoa, teaminfo|
    teaminfo[:players].each do |playerindex|
      playerarr.push(playerindex)
    end 
  end 
  
  playerarr.each do |pstats|
    if moststeals[:steals] < pstats[:steals]
      moststeals = pstats
    end   
  end   
  
  if player_with_longest_name == moststeals[:player_name]
    true 
  else 
    false 
  end  
end 









