FROM fluent/fluentd:v1.4-1

USER root

RUN apk add --no-cache --update --virtual .build-deps build-base ruby-dev sudo \
	&& gem install fluent-plugin-elasticsearch \
	&& gem sources --clear-all \
	&& apk del .build-deps build-base ruby-dev \
	&& rm -rf /home/fluent/.gem/ruby/*/cache/*.gem

USER fluent