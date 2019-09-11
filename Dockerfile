FROM wodby/drupal-php:5.6-dev-macos-4.13.10

USER root

RUN apk update && apk upgrade

RUN apk add ruby ruby-bundler ruby-nokogiri ruby-dev build-base libxml2-dev libxslt-dev libffi-dev ruby-irb ruby-rdoc

RUN apk update && apk add nodejs nodejs-npm && apk add python make g++

RUN apk add --update build-base libffi-dev && \
    gem update --system && \
    gem install compass

RUN npm install -g grunt-cli

USER wodby

RUN drush @none dl registry_rebuild-7.x
