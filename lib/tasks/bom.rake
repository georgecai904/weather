require 'nokogiri'
require 'open-uri'
require 'json'
BASE = 'http://www.bom.gov.au'

namespace :bom do
  desc "Fetch weather reports from bom every 10 minutes"
  task :fetch => :environment do
    puts "#{Time.now} - Start!"
    period = Period.create(datetime:Time.now)
    get_bom_reading period
    get_forecast_reading period
    puts "#{Time.now} - Success!"
  end

  def get_bom_reading period
    bom = Datasource.find_by_name("BOM")
    pattern = bom.pattern
    doc = Nokogiri::HTML(open(bom.url))
    doc.css("tr").each do |tag|
      station_name = tag.css(pattern.station_name).text
      next if (station_name.empty?)
      station = Station.find_by_name(station_name)

      if not station
        link = BASE + tag.css(pattern.station_name).map { |link| link['href'] }[0].to_s
        file = Nokogiri::HTML(open(link))
        lat = file.css(".stationdetails td:nth-child(4)").text
        long = file.css(".stationdetails td:nth-child(5)").text
        station = Station.create(
            :name => station_name,
            :longitude => ((/ Lon: (.*) /).match long)[1],
            :latitude => ((/ Lat: (.*) /).match lat)[1]
        )
      end

      latest_time = tag.css(pattern.time).text
      reading = Report.new
      reading.period = period
      reading.time = latest_time
      reading.rainfall = tag.css(pattern.rainfall).text
      reading.temperature = tag.css(pattern.temperature).text
      reading.dew_point = tag.css(pattern.dew_point).text
      reading.wind_direction = tag.css(pattern.wind_direction).text
      reading.wind_speed = tag.css(pattern.wind_speed).text
      reading.station = station
      reading.datasource = bom
      reading.save
      station.reports << reading
      period.reports << reading
    end
  end

  def get_forecast_reading period
    source = Datasource.find_by_name("Forecast")
    Station.all.each do |station|

      lat_long = station.latitude.to_s + "," + station.longitude.to_s
      forecast = JSON.parse(open("#{source.url}/#{source.api}/#{lat_long}?units=si").read)
      reading = Report.new
      currently = forecast["currently"]
      reading.period = period
      reading.time = Time.at(currently["time"])
      reading.temperature = currently["temperature"]
      reading.dew_point = currently["dewPoint"]
      reading.wind_speed = (currently["windSpeed"]*3.6).round(1)
      reading.wind_direction = currently["windBearing"]
      reading.rainfall = currently["precipIntensity"]
      reading.datasource = source
      reading.save
      station.reports << reading
      period.reports << reading
    end
  end
end
