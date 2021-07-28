#	Adminer container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM  debian:buster
RUN   apt-get update

# Installing debugging tools
# RUN  apt-get install -y procps nano mc nmap
# COPY ./conf/info.php /usr/share/wordpress/info.php

# Installing the php-fpm and Adminer versions available in Debian
# at the time the project was created ('apt policy' command)
RUN apt-get install -y php-fpm=2:7.3+69 adminer=4.7.1-1

# Configuring PHP for service over the Docker network on port 9000
# using the config file '/etc/php/7.3/fpm/pool.d/www.conf'
RUN	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf
RUN	chown -R www-data:www-data /usr/share/adminer

# Instructions for Docker that the container is listening on port 9000
# (by default TCP protocol)
EXPOSE 9000

# Run the php-fpm daemon once to create a pid file '/run/php/php7.3-fpm.pid'
RUN service php7.3-fpm start

# Launching php-fpm in the foreground
ENTRYPOINT ["php-fpm7.3", "-F"]
