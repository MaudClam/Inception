#	Redis container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM  debian:buster
RUN   apt-get update

# Installing debugging tools
RUN  apt-get install -y procps nano mc nmap

# Installing the Redis versions available in Debian
# at the time the project was created ('apt policy' command)
RUN apt-get install -y redis=5:5.0.3-4+deb10u3

# Copying the config-file
COPY ./conf/redis.conf /var/lib/redis/redis.conf

# Instructions for Docker that the container is listening on port 6379
# (by default TCP protocol)
EXPOSE 6379

# Launching Redis in the foreground
ENTRYPOINT ["redis-server", "/var/lib/redis/redis.conf"]
