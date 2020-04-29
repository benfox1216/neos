class GetNeoInfo
  def self.formatted_asteroid_data(data)
    data.map do |asteroid|
      {
        name: asteroid[:name],
        diameter: "#{asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
        miss_distance: "#{asteroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
      }
    end
  end
  
  def self.largest_asteroid_diameter(data)
    data.map do |asteroid|
      asteroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
    end.max {|a,b| a<=>b}
  end
  
  def self.total_number_of_asteroids(data)
    data.count
  end
end