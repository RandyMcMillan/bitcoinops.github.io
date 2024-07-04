FROM ruby:2.6.4-stretch
COPY . .
RUN bundle install && make preview
