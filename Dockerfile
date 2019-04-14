FROM fluent/fluentd:v1.4-1

USER root

RUN apk add --no-cache --update --virtual .build-deps build-base ruby-dev sudo \
	&& gem install fluent-plugin-elasticsearch fluent-plugin-secure-forward fluent-plugin-detect-exceptions \
	&& gem sources --clear-all \
	&& apk del .build-deps build-base ruby-dev \
	&& rm -rf /root/.gem

USER fluent