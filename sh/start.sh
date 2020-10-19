#!/bin/sh
set -e

echo "Preparing runtime...."
if [ -f /var/www/html/index.nginx-debian.html ]; then
    rm /var/www/html/index.nginx-debian.html;
fi

# Symlinks
if [ -L /var/www/html/.index.php ]; then
    rm /var/www/html/.index.php;
fi
if [ -L /var/www/html/.pdirl ]; then
    rm /var/www/html/.pdirl;
fi
if [ -L /var/www/html/.htaccess ]; then
    rm /var/www/html/.htaccess;
fi

ln -s /usr/share/pdirl/index.php /var/www/html/.index.php
ln -s /usr/share/pdirl/app /var/www/html/.pdirl
ln -s /usr/share/pdirl/.htaccess /var/www/html/.htaccess

echo "Starting services...."
exec /usr/bin/s6-svscan /services
