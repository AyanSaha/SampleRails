FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libxml2 git mariadb-client nodejs openssl ca-certificates
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app