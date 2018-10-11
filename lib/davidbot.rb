#!/usr/bin/env ruby

require 'slack-ruby-bot'

# Load all the hooks
Dir[File.join(__dir__, 'davidbot', 'hooks', '*.rb')].each { |file| require file }

# Load all other commands
Dir[File.join(__dir__, 'davidbot', 'commands', '*.rb')].each { |file| require file }

class DavidBot < SlackRubyBot::Bot
end
