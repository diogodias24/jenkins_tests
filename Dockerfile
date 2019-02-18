FROM alpine:3.9

LABEL Diogo Dias <saidogoid2@gmail.com>

ENV \
    # When using Composer, disable the warning about running commands as root/super user
    COMPOSER_ALLOW_SUPERUSER=1 \
    DEPENDENCIES="nano composer php php-dom php-json php-xml php-phar php-openssl php-mbstring php-iconv php-tokenizer php-xmlwriter php-pdo php-session php-zip"

RUN set -x \
    && apk add --no-cache $DEPENDENCIES \
    && adduser -S jenkins \
    && mkdir -p /var/www/site 

#COPY php.ini /etc/php7/php.ini

COPY . /var/www/site

USER jenkins

WORKDIR /var/www/site

CMD /bin/sh