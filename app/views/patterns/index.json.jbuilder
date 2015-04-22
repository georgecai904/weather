json.array!(@patterns) do |pattern|
  json.extract! pattern, :id, :station_name, :time, :temperature, :dew_point, :wind_direction, :wind_speed
  json.url pattern_url(pattern, format: :json)
end
