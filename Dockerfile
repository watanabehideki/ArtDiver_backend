FROM ruby:2.7.1

RUN apt-get update -qq && \
    apt-get install -y nodejs &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    apt-get update && yes | apt-get install yarn  \
    build-essential \
    default-mysql-client 

RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential nodejs curl git mariadb-client yarn sudo

RUN mkdir /artdiver

WORKDIR /artdiver

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

COPY Gemfile /artdiver/Gemfile
COPY Gemfile.lock /artdiver/Gemfile.lock

RUN gem install bundler && bundle install

ADD . /artdiver

EXPOSE 4001
