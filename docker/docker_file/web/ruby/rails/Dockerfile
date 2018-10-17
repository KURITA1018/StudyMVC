FROM ruby
ENV LANG C.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update -qq && apt-get install -y build-essential nodejs vim tree
RUN apt-get install -y default-libmysqlclient-dev mysql-client
RUN apt-get install -y libpq-dev

ENV BUNDLE_JOBS=4 \
    APP_DIR=/app

RUN mkdir $APP_DIR

WORKDIR $APP_DIR

COPY workspace/Gemfile $APP_DIR
COPY workspace/Gemfile.lock $APP_DIR

RUN bundle install
