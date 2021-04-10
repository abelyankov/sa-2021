FROM ruby:2.7.2-alpine3.13

ENV BUNDLER_VERSION=2.2.6

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      fontconfig \
      g++ \
      gcc \
      git \
      less \
      libgcc \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      musl \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      qt5-qtbase \
      qt5-qtbase-x11 \
      qt5-qtsvg \
      qt5-qtwebkit \
      ttf-freefont \
      ttf-dejavu \
      ttf-droid \
      ttf-liberation \
      ttf-ubuntu-font-family \
      tzdata \
      yarn \

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.8/main' >> /etc/apk/repositories && \
    apk add --no-cache libcrypto1.0 libssl1.0

RUN gem install bundler -v 2.2.6

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]