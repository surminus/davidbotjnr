#!/usr/bin/env ruby

require 'slack-ruby-bot'

# Load all hooks and commands
%w[commands hooks].each do |dir|
  Dir[File.join(__dir__, 'davidbot', dir, '*.rb')].each do |file|
    require file
  end
end

class DavidBot < SlackRubyBot::Bot
end
