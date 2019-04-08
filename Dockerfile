FROM diogodias2/alpine_php7

LABEL Diogo Dias <saidogoid2@gmail.com>

ENV \
    WEBSITE_PATH="/var/www/site"

RUN set -x \
    && adduser -u 111 -S jenkins \
    && addgroup -g 115 -S jenkins \
    && mkdir -p $WEBSITE_PATH \
    && chmod u=rwx,g=rwx $WEBSITE_PATH \
    && chown -R jenkins:jenkins $WEBSITE_PATH

#COPY php.ini /etc/php7/php.ini

USER jenkins

WORKDIR $WEBSITE_PATH

CMD /bin/sh