FROM ruby:2.5.3

RUN \
  curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh && \
  bash nodesource_setup.sh && \
  apt-get remove -y cmdtest && \
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | apt-key add - && \
  echo "deb http://apt.thoughtbot.com/debian/ stable main" | tee /etc/apt/sources.list.d/thoughtbot.list && \
  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh && \
  apt-get update -qq && apt-get install -y build-essential postgresql-client nodejs yarn parity

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler
RUN bundle install

COPY . $APP_HOME