FROM alpine:3.9

LABEL Diogo Dias <saidogoid2@gmail.com>

ENV \
    # When using Composer, disable the warning about running commands as root/super user
    COMPOSER_ALLOW_SUPERUSER=1 \
    DEPENDENCIES="vim composer php"

RUN set -x \
    && apk add --no-cache $DEPENDENCIES \
    && adduser -S jenkins \
    && mkdir -p /var/www/site


USER jenkins

WORKDIR /var/www/site

CMD /bin/sh
