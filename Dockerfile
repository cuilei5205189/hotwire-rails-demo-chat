FROM ruby:2.7.1
RUN apt-get update -yqq
WORKDIR /app
COPY ./Gemfile* /app
RUN bundle install
RUN rails db:setup && rails db:migrate
COPY ./ /app/
CMD ["bin/rails", "s", "-b", "0.0.0.0"] 

