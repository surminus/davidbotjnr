FROM ruby:latest

COPY . .

RUN bundle install

CMD bundle exec ruby davidbotjnr.rb
