require 'httparty'

class Weather < SlackRubyBot::Bot
  match /[W|w]eather in (?<location>\w*)/ do |client, data, match|
    api_key = ENV['DATAPOINT_API_TOKEN']
    query_location = match[:location].capitalize

    if api_key
      base_url = 'http://datapoint.metoffice.gov.uk/public/data'
      locations = HTTParty.get("#{base_url}/val/wxfcs/all/json/sitelist?key=#{api_key}")['Locations']['Location']

      location_exact = locations.select { |l| l['name'] == query_location }
      location_fuzzy = locations.select { |l| l['name'] =~ /#{query_location}/ }
      if location_exact.empty? && location_fuzzy.empty?
        client.say(channel: data.channel, text: "I'm sorry, I don't know #{query_location}.")
      else
        unless location_exact.empty?
          location = location_exact.first['id']
        else
          location = location_fuzzy.first['id']
        end

        forecast = HTTParty.get("#{base_url}/val/wxfcs/all/json/#{location}?res=3hourly&key=#{api_key}")
        weather_now = forecast['SiteRep']['DV']['Location']['Period'].first['Rep'].first

        temp_celcius   = weather_now['F'].to_i
        chance_of_rain = weather_now['Pp'].to_i
        wind_speed     = weather_now['S'].to_i

        if temp_celcius > 30
          warmth = "silly hot"
        elsif temp_celcius > 25
          warmth = "hot"
        elsif temp_celcius > 20
          warmth = "warm"
        elsif temp_celcius > 10
          warmth = "mild"
        elsif temp_celcius > 5
          warmth = "chilly"
        elsif temp_celcius > 0
          warmth = "cold"
        else
          warmth = "stupid cold"
        end

        if chance_of_rain > 90
          rain = "but will rain! Take an umbrella :umbrella:"
        elsif chance_of_rain > 70
          rain = "but it looks like it might rain :rain_cloud:"
        elsif chance_of_rain > 50
          rain = "but there is a chance of rain."
        elsif chance_of_rain <= 50
          rain = "and it's more likely to stay dry."
        elsif chance_of_rain < 30
          rain = "and it probably won't rain."
        elsif chance_of_rain < 10
          rain = "and it will be dry :tada:"
        end

        if temp_celcius > 20 && chance_of_rain < 30
          comment = "Should be a great day! :sunny:"
        elsif temp_celcius < 10 && chance_of_rain > 70
          comment = "I would stay indoors if I were you. :house: :rain_cloud: :snowflake:"
        elsif wind_speed > 5
          comment = "It will also be windy!"

        else
          comment = ""
        end

        human_forecast = "It is #{warmth} (#{temp_celcius}c) today, #{rain} #{comment}"

        client.say(channel: data.channel, text: human_forecast)
      end
    end
  end
end
