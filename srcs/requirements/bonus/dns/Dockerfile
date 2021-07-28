#	BIND9 container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM  debian:buster
RUN   apt-get update

# Installing debugging tools
RUN  apt-get install -y procps nano mc nmap

RUN apt-get install -y bind9=1:9.11.5.P4+dfsg-5.1+deb10u5 bind9utils=1:9.11.5.P4+dfsg-5.1+deb10u5

#/etc/resolv.conf
COPY ./conf/named.conf.default-zones /etc/bind/named.conf.default-zones
COPY ./conf/db.mclam.42.fr /etc/bind/db.mclam.42.fr
COPY ./conf/named.conf.options /etc/bind/named.conf.options

EXPOSE 53

ENTRYPOINT ["/usr/sbin/named", "-g", "-u", "bind", "-4"]
