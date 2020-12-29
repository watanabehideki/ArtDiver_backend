# Debianがベースのrubyイメージを指定
FROM ruby:2.7.1

# 必要なものをインストール
RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client

# rails用のディレクトリを作成
RUN mkdir /artdiver

# ローカルマシン(Mac)からコンテナの中にファイルをコピー
COPY Gemfile /artdiver/Gemfile
COPY Gemfile.lock /artdiver/Gemfile.lock

# 作業ディレクトリを指定
WORKDIR /artdiver

# 上でコピーしたGemfileに従ってGemをインストール
RUN gem install bundler && bundle install

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets

EXPOSE 4001