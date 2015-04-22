# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


types = Sourcetype.create([{type_name: "url"}, {type_name: "api"}])

bom_pattern = Pattern.create(
    station_name: "a",
    time: "td:nth-child(2)",
    temperature: "td:nth-child(3)",
    rainfall: "td:nth-child(14)",
    dew_point: "td:nth-child(5)",
    wind_direction: "td:nth-child(8)",
    wind_speed: "td:nth-child(9)",
)

bom = Datasource.create(
    name: "BOM",
    url: "http://www.bom.gov.au/vic/observations/melbourne.shtml",
    pattern: bom_pattern,
    sourcetype: types.first
)

forecast = Datasource.create(
    name: "Forecast",
    url: 'https://api.forecast.io/forecast',
    api: "de5a3fb757373a8cac74b78db53bb4f5",
    sourcetype: types.second
)

