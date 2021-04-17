FROM elixir:1.11

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.8 --force && \
    mix local.rebar --force

ENV APP_HOME /ex_birthday_slack_bot
RUN mkdir $APP_HOME
ADD . $APP_HOME
WORKDIR $APP_HOME

RUN mix deps.get && \
    cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development