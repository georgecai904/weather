json.array!(@reports) do |report|
  json.extract! report, :id, :time, :temperature, :dew_point, :wind_direction, :wind_speed
  json.url report_url(report, format: :json)
end
