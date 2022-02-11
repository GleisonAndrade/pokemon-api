FROM ruby:3.0.3-alpine3.15

ENV BUNDLER_VERSION=2.2.32

RUN apk update && apk add build-base nodejs libxml2-dev tzdata postgresql-dev

RUN gem install bundler -v "$BUNDLE_VERSION"

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]