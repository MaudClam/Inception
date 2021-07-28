#	Nginx container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM	debian:buster
RUN   apt-get update

# Installing debugging tools
# RUN  apt-get install -y procps nano mc nmap

# Installing the Nginx version available in Debian
# at the time the project was created ('apt policy' command)
# and creating working directories
RUN	apt-get install -y nginx=1.14.2-2+deb10u4 && \
		mkdir -p /etc/nginx/ssl && \
		mkdir -p /usr/share/wordpress && \
		mkdir -p /usr/share/adminer

# Assigning arguments
ARG		certs_
ARG		domain_name

# Copying SSL certificates
COPY	${certs_}/*.key /etc/nginx/ssl
COPY	${certs_}/*.crt /etc/nginx/ssl

# Copying the servers configuration
COPY	./conf/default /etc/nginx/sites-available/default

# Disabling daemonizing, SSL protocols TLSv1 and TLSv1.1
# in the config file '/etc/nginx/nginx.conf'
# and assign a domain name in the config file '/etc/nginx/sites-available/default'
RUN	echo "daemon off;" >> /etc/nginx/nginx.conf && \
		sed -i "s/ssl_protocols TLSv1 TLSv1.1/ssl_protocols /" /etc/nginx/nginx.conf && \
		sed -i "s/DOMAIN_NAME/${domain_name}/" /etc/nginx/sites-available/default

# Instructions for Docker that the container is listening on port 443
# (by default TCP protocol)
EXPOSE 443

# Launching Nginx in the foreground
ENTRYPOINT ["nginx"]

		

