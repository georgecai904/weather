json.array!(@stations) do |station|
  json.extract! station, :id, :name, :longitude, :latitude
  json.url station_url(station, format: :json)
end
