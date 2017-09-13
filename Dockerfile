FROM ruby:2.3.2

MAINTAINER Michelle Noorali <michelle.noorali@gmail.com>

ENV PORT 3000
EXPOSE 3000

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get install -y build-essential nodejs

RUN mkdir -p /twitter-clone
WORKDIR /twitter-clone
COPY . /twitter-clone

RUN gem install rails -v '4.1.6'
RUN gem install bundler && bundle install


RUN rake db:migrate


CMD ["rails", "server"]
