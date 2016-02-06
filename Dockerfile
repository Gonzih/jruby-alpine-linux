FROM anapsix/alpine-java:jre8
MAINTAINER Max Gonzih <gonzih at gmail com>

ENV JRUBY_VERSION 9.0.5.0
ENV PATH /opt/jruby/jruby-$JRUBY_VERSION/bin:$PATH

RUN apk update && apk upgrade && apk add curl && \
    mkdir -p /opt/jruby && \
    curl https://s3.amazonaws.com/jruby.org/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz > /tmp/jruby.tar.gz && \
    tar -xvzf /tmp/jruby.tar.gz -C /opt/jruby && \
    rm /tmp/jruby.tar.gz && \
    echo 'gem: --no-rdoc --no-ri' >> /root/.gemrc && \
    gem install bundler && \
    ln -s /opt/jruby/jruby-$JRUBY_VERSION/bin /usr/local/bin/ruby && \
    apk del curl
