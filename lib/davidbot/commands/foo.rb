class Foo < SlackRubyBot::Commands::Base
  match /^foo$/ do |client, data, match|
    client.say(channel: data.channel, text: 'bar')
  end
end
