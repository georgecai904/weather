URL = 'http://www.bom.gov.au/vic/observations/melbourne.shtml'
BASE = 'http://www.bom.gov.au'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'date'

def part1()
  doc = Nokogiri::HTML(open(URL))
  doc.css("tr").each do |tag|
    city = tag.css("a").text
    next if (city.empty?)
    link = BASE + tag.css("a").map { |link| link['href'] }[0].to_s
    file = Nokogiri::HTML(open(link))
    lat = file.css(".stationdetails td:nth-child(4)").text
    long = file.css(".stationdetails td:nth-child(5)").text
    p ((/ Lon: (.*) /).match long)[1]
    p ((/ Lat: (.*) /).match lat)[1]
    # puts tag.css("td:nth-child(14)").text
    temperature = tag.css("td:nth-child(3)").text
    dewPoint = tag.css("td:nth-child(5)").text
    windDirection = tag.css("td:nth-child(8)").text
    windSpeed = tag.css("td:nth-child(9)").text
  end
end

API_KEY = "de5a3fb757373a8cac74b78db53bb4f5"
BASE_URL = "https://api.forecast.io/forecast"
LAT_LONG = "-37.819570,145.090977"

def part2()
  forecast = JSON.parse(open("#{BASE_URL}/#{API_KEY}/#{LAT_LONG}").read)
  currently = forecast["currently"]
  temperature = currently["temperature"]
  dewPoint = currently["dewPoint"]
  winSpeed = currently["winSpeed"]
  humidity = currently["humidity"]
  p currently
end

part2()

# a = " Lon: 144.80 "
# regex = / Lon: (.*) /
# p (regex.match a)[1]