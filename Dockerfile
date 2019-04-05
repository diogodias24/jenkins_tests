FROM alpine:3.9

LABEL Diogo Dias <saidogoid2@gmail.com>

ENV \
    # When using Composer, disable the warning about running commands as root/super user
    COMPOSER_ALLOW_SUPERUSER=1 \
    DEPENDENCIES="nano composer php php-dom php-json php-xml php-phar php-openssl php-mbstring php-iconv \
                  php-tokenizer php-xmlwriter php-pdo php-session php-zip php-simplexml php-fileinfo git" \
    WEBSITE_PATH="/var/www/site"

RUN set -x \
    && apk add --no-cache $DEPENDENCIES \
    && adduser -u 111 -S jenkins \
    && addgroup -g 115 -S jenkins \
    && mkdir -p $WEBSITE_PATH \
    && chmod u=rwx,g=rwx $WEBSITE_PATH \
    && chown -R jenkins:jenkins $WEBSITE_PATH

#COPY php.ini /etc/php7/php.ini

USER jenkins

WORKDIR $WEBSITE_PATH

CMD /bin/sh