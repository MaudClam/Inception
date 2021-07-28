#	BIND9 container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM  debian:buster
RUN   apt-get update

# Installing debugging tools
#RUN  apt-get install -y procps nano mc nmap host

# Installing the BIND9 version available in Debian
# at the time the project was created ('apt policy' command)
RUN apt-get install -y bind9=1:9.11.5.P4+dfsg-5.1+deb10u5 bind9utils=1:9.11.5.P4+dfsg-5.1+deb10u5

# Copying the server configuration
COPY ./conf/named.conf.default-zones /etc/bind/named.conf.default-zones
COPY ./conf/db.mclam.42.fr /etc/bind/db.mclam.42.fr

# Instructions for Docker that the container is listening on port 53
# (by default UDP and TCP protocols)
EXPOSE 53/udp
EXPOSE 53/tcp

# Instructions for Docker that the container is listening on port 53
# (by default TCP protocol)
ENTRYPOINT ["/usr/sbin/named", "-g", "-u", "bind", "-4"]
