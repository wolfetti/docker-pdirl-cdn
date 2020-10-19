FROM debian:buster-slim

## Install packages
RUN \
  apt-get update \
  && apt-get install --no-install-recommends -y \
    s6 \
    cron \
    nginx-full \
    ca-certificates \
    php-fpm \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

## CDN volume
VOLUME /var/www/html

## Copy configurations and scripts
COPY ./pdirl /usr/share/pdirl
COPY ./services /services
COPY ./conf/nginx_site /etc/nginx/sites-available/default
ADD ./sh/start.sh /

## Finishing installation
RUN \

  # App permissions
  chown -R www-data:www-data /usr/share/pdirl \
  
  # CDN permissions
  && chmod 755 /var/www \
  && chmod 755 /var/www/html \
  && chown -R www-data:www-data /var/www/html \
  
  # Scripts
  && chmod +x /start.sh \
  
  # Services
  && for s in $(/bin/ls /services); do chmod +x /services/$s/* ; done

# Start
EXPOSE 80
ENTRYPOINT ["/start.sh"]
CMD []
