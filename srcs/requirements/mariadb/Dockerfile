#	MariaDB container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM  debian:buster
RUN   apt-get update

# Installing debugging tools
# RUN	apt-get install -y procps nano mc nmap

# Installing the Mariadb (hereinafter MySQL) version available in Debian
# at the time the project was created ('apt policy' command)
RUN		apt-get install -y mariadb-server=1:10.3.29-0+deb10u1

# Configuring MySQL for service over the Docker network on port 3306
# using the config file '/etc/mysql/mariadb.conf.d/50-server.cnf'
RUN	sed -i "s/\#port/port/" "/etc/mysql/mariadb.conf.d/50-server.cnf" && \
    sed -i "s/bind-address/\#bind-address/" "/etc/mysql/mariadb.conf.d/50-server.cnf"

# Assigning arguments
ARG mysql_root_password
ARG mysql_user
ARG mysql_password
ARG mysql_database

# Copying the database dump, with two WordPress users and initial settings
COPY ./conf/wordpress.sql /

# Force MySQL to do the following using arguments:
# -assign root password for MySQL,
# -creating a WordPress database,
# -loading the database dump,
# -creating a WordPress database admin (whose name is not *admin* :).
RUN	service mysql start && mysqladmin -u root password ${mysql_root_password} && \
    echo "CREATE DATABASE IF NOT EXISTS ${mysql_database}" | mysql -u root -p${mysql_root_password} && \
    mysql -u root -p${mysql_root_password} ${mysql_database} < wordpress.sql && \
    echo "CREATE USER IF NOT EXISTS '${mysql_user}' IDENTIFIED BY '${mysql_password}';" | mysql -u root -p${mysql_root_password} && \
    echo "GRANT ALL PRIVILEGES ON ${mysql_database}.* TO '${mysql_user}' IDENTIFIED BY '${mysql_password}';" | mysql -u root -p${mysql_root_password} && \
    echo "FLUSH PRIVILEGES;" | mysql -u root -p${mysql_root_password}

# Instructions for Docker that the container is listening on port 3306
# (by default TCP protocol)
EXPOSE 3306

# Launching MySQL in the foreground
ENTRYPOINT ["mysqld"]
