FROM diogodias2/bionic-apache_php7x

USER root  

RUN useradd -ms /bin/bash jenkins && echo "jenkins:jenkins" | chpasswd && adduser jenkins sudo \
    && sudo usermod -a -G www-data jenkins 
#	&& echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER jenkins

WORKDIR /var/www/site
