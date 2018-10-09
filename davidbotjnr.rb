#!/usr/bin/env ruby

require 'slack-ruby-bot'

class DavidBot < SlackRubyBot::Bot
  command 'hello' do |client, data, match|
    username = client.store.users[data.user].name
    client.say(text: "Hi, #{username}!", channel: data.channel)
  end
end

DavidBot.run
