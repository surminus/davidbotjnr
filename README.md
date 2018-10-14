# DavidBot Junior

DavidBot was a bot we used to have lurking on an IRC server for
years. It ran happily on Slack, until Slack disabled access
for IRC clients.

This is a replacement written in Ruby using the
[slack-ruby-bot](https://github.com/slack-ruby/slack-ruby-bot) gem.

# Behaviours

## Hooks

### Join channel

[[lib/davidbot/hooks/join_channel.rb]]

Says a greeting when a user joins the channel.

### Leave channel

[[lib/davidbot/hooks/leave_channel.rb]]

Says a goodbye when a user leaves the channel.

## Commands

### foo

[[lib/davidbot/commands/foo.rb]]

Replies with "bar".

### Weather

[[lib/davidbot/commands/weather.rb]]

Scans for the phrase similar to "weather in London" and outputs the
temperature and chance of rain in a human readable format.

# Contributing

## Setup

Ensure you have [Ruby](https://www.ruby-lang.org/en/) and [Bundler](https://bundler.io/)
installed.

To install dependencies, run:

`bundle install`

To run the bot:

`SLACK_API_TOKEN=<token> bundle exec bin/davidbot.rb`

## Adding new behaviours

The bot comes with two types of functionality, event based and RTM event API
based.

See the [docs](https://github.com/slack-ruby/slack-ruby-bot) for details on
each of these.

# Deployment

Build the Docker image:

`docker build -t surminus/davidbotjnr .`

Push it to Dockerhub:

`docker push surminus/davidbotjnr`

Run Chef:

```
cd chef
knife solo cook <server> -N davidbot
```
