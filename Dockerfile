FROM ruby:latest
COPY . .
RUN bundle install --without development
CMD bundle exec bin/davidbot.rb
