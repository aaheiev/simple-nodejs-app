# docker build -t simple-nodejs-app-test ./test

FROM ruby:2.6-stretch

ARG PHANTOM_JS_VERSION

ARG APP_ASSEMBLY_VERSION
ARG TEST_USER

ENV PHANTOM_JS_VERSION   ${PHANTOM_JS_VERSION:-2.1.1-linux-x86_64}
ENV TEST_USER            ${TEST_USER:-test}
ENV APP_BASE_URL         "http://simple-nodejs-app:3000"
ENV APP_ASSEMBLY_VERSION "0.4.1.22"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        bzip2 \
        libfontconfig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN set -x  \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
    && mkdir /tmp/phantomjs \
    && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOM_JS_VERSION}.tar.bz2 \
        | tar -xj --strip-components=1 -C /tmp/phantomjs \
    && mv /tmp/phantomjs/bin/phantomjs /usr/local/bin \
    && curl -Lo /tmp/dumb-init.deb https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb \
    && dpkg -i /tmp/dumb-init.deb \
    && apt-get purge --auto-remove -y \
        curl \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* \
    && useradd --system --uid 52379 -m --shell /usr/sbin/nologin ${TEST_USER} \
    && su ${TEST_USER} -s /bin/sh -c "phantomjs --version"

WORKDIR /test

COPY . ./

RUN gem install bundler --no-document \
    && gem install nokogiri \
    && bundle install \
    && chown -R $TEST_USER /test

USER $TEST_USER
