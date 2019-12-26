FROM wodby/drupal-php:7.2-dev-4.13.10

USER root

RUN apk update && apk upgrade

# Install python base.
RUN apk add --update --no-cache \
  build-base \
  libffi \
  libffi-dev \
  openssl \
  openssl-dev \
  python2 \
  python2-dev \
  py2-crcmod \
  py2-openssl \
  py2-pip \
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
