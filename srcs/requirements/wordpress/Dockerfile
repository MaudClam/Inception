#	WordPress container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM	debian:buster
RUN		apt-get update

# Installing debugging tools
RUN	apt-get install -y procps nano mc nmap

# Installing the php-fpm, WordPress and php-redis (for bonus) versions available
# in Debian at the time the project was created ('apt policy' command)
RUN apt-get install -y php-fpm=2:7.3+69 wordpress=5.0.12+dfsg1-0+deb10u1
COPY ./conf/info.php /usr/share/wordpress/info.php

#For Redis
RUN	apt-get install -y php-redis=4.2.0-1

# Assigning arguments
ARG	mysql_database
ARG	mysql_user
ARG	mysql_password
ARG	wordpress_database_host
ARG	wordpress_table_prefix
ARG	wordpress_debug
#For Redis
ARG domain_name

# Copy the Redis-Object-Cache script
# for the operation of the Redis (for bonus) with Wordpress
COPY ./conf/object-cache.php /usr/share/wordpress/wp-content/object-cache.php

# Configuring PHP for service over the Docker network on port 9000
# using the config file '/etc/php/7.3/fpm/pool.d/www.conf'
RUN	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf

COPY ./conf/wp-content /usr/share/wordpress/wp-content

# Configuring WordPress to work with MySQL
# using the pre-prepared configuration file '/usr/share/wordpress'
COPY ./conf/wp-config.php /usr/share/wordpress
RUN sed -i "s/MYSQL_DATABASE/$mysql_database/" /usr/share/wordpress/wp-config.php && \
		sed -i "s/MYSQL_USER/$mysql_user/" /usr/share/wordpress/wp-config.php && \
		sed -i "s/MYSQL_PASSWORD/$mysql_password/" /usr/share/wordpress/wp-config.php && \
		sed -i "s/WORDPRESS_DATABASE_HOST/$wordpress_database_host/" /usr/share/wordpress/wp-config.php && \
		sed -i "s/WORDPRESS_TABLE_PREFIX/$wordpress_table_prefix/" /usr/share/wordpress/wp-config.php && \
		sed -i "s/WORDPRESS_DEBUG/$wordpress_debug/" /usr/share/wordpress/wp-config.php
#		 && \
#		chown -R www-data:www-data $(find / | grep wordpress)

#For Redis
RUN		sed -i "s/DOMAIN_NAME/$domain_name/" /usr/share/wordpress/wp-config.php
#		chown -R www-data:www-data /usr/share/wordpress

#Настройка ПХП на сохранение сессий на сервер редиса
RUN sed -i "s/session.save_handler = files/session.save_handler = redis/g" /etc/php/7.3/fpm/php.ini && \
		sed -i "s/;session.save_path = \"\/var\/lib\/php\/sessions\"/\session.save_path = \"tcp\:\/\/redis\:6379\"/" /etc/php/7.3/fpm/php.ini


# Instructions for Docker that the container is listening on port 9000
# (by default TCP protocol)
EXPOSE 9000

# Run the php-fpm daemon once to create a pid file '/run/php/php7.3-fpm.pid'
RUN service php7.3-fpm start

# Launching php-fpm in the foreground
ENTRYPOINT ["php-fpm7.3", "-F"]
