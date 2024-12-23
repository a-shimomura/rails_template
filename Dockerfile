FROM ruby:3.3.6

ENV APP_HOME /app
ENV TZ Asia/Tokyo
ENV PORT 3001
ENV HOST 0.0.0.0

WORKDIR ${APP_HOME}

COPY Gemfile ${APP_HOME}/Gemfile
COPY Gemfile.lock ${APP_HOME}/Gemfile.lock

RUN apt-get update

RUN bundle install

COPY . ${APP_HOME}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE ${PORT}

CMD ["bundle", "exec", "rails", "server", "-b", ${HOST}]
