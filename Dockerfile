FROM wodby/drupal-php:7.3-dev-macos-4.15.0

USER root

RUN apk update && apk upgrade

# Install python base.
RUN apk add --update --no-cache \
  build-base \
  libffi \
  libffi-dev \
  openssl \
  openssl-dev \
  python3 \
  python3-dev \
  py3-crcmod \
  py3-openssl \
  ruby \
  ruby-bundler \
  ruby-nokogiri \
  ruby-dev \
  ruby-irb \
  ruby-rdoc \
  libxml2-dev \
  libffi-dev \
  nodejs \
  nodejs-npm \
  make \
  g++ \
  && rm -rf /var/lib/apt/lists/*

RUN gem update --system && \
    gem install compass

RUN npm install -g grunt-cli

# Install ansible.
RUN pip3 install --upgrade pip \
  && pip3 install --upgrade ansible==2.9.2 python-magic

USER wodby

RUN drush @none dl -y registry_rebuild-7.x
