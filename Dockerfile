# Start from an Ubuntu 20.04 image with PHP 8.0 and Nginx
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get install -y subversion nginx php8.0-fpm optipng pngquant \
  php-pear php8.0-dev libgraphicsmagick1-dev php8.0-curl php8.0-gd

# Install gmagick
RUN yes "\n" | pecl -d preferred_state=beta install -s gmagick

# Enable gmagick
RUN echo "extension=gmagick.so" > /etc/php/8.0/mods-available/gmagick.ini
RUN phpenmod gmagick

# Set up project
WORKDIR /var/www
RUN svn checkout https://code.svn.wordpress.org/photon/ photon/

# Nginx configuration
COPY default /etc/nginx/sites-available/default

# Start Nginx and PHP-FPM
CMD service php8.0-fpm start && nginx -g 'daemon off;'

# Expose port 80
EXPOSE 80
