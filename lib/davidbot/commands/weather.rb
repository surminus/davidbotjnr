require 'httparty'

class Weather < SlackRubyBot::Bot
  match /[w|W]eather in (?<location>.*)[\?]?$/ do |client, data, match|
    api_key = ENV['OPEN_WEATHER_MAP_API_TOKEN']
    query_location = match[:location]

    if api_key
      url = "https://api.openweathermap.org/data/2.5/weather?q=#{query_location}&units=metric&appid=#{api_key}"
      result = HTTParty.get(url)

      temp_celcius   = result['main']['temp'].round # Integer
      description    = result['weather'].first['description'] # Example result: Clear
      sunrise        = Time.at(result['sys']['sunrise']).strftime("%H:%M:%S")
      sunset         = Time.at(result['sys']['sunset']).strftime("%H:%M:%S")
      city           = result['sys']['country']

      output = <<~HEREDOC
      Weather is *#{description}*

      Temperature: *#{temp_celcius}c*
      Sunrise: *#{sunrise}*
      Sunset: *#{sunset}*

      Result returned for #{result['name']}, #{city}
      HEREDOC

      client.say(channel: data.channel, text: output)
    else
      puts "No API key set"
    end
  end
end
