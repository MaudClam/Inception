#	vsFTPd container's Dockerfile

# Installing Debian Buster OS using Docker image 'debian:buster'
FROM  debian:buster
RUN   apt-get update

# Installing debugging tools
RUN  apt-get install -y procps nano mc nmap

# Installing the vsFTPd server versions available in Debian
# at the time the project was created ('apt policy' command)
RUN apt-get install -y vsftpd=3.0.3-12


ARG ftp_user
ARG ftp_password

RUN echo "${ftp_password}\n${ftp_password}\n" | adduser ${ftp_user} && \
		echo "${ftp_user}" >> /var/log/vsftpd.userlist && \
		chown -R ${ftp_user}:${ftp_user} /home/${ftp_user}
#		mkdir -p /var/run/vsftpd/empty

# Copying the config-file
COPY ./conf/vsftpd.conf /var/log/vsftpd.conf
COPY ./conf/ftp.sh /
RUN chmod +x /ftp.sh

# Instructions for Docker that the container is listening on port 6379
# (by default TCP protocol)
EXPOSE 21

# Launching vsFTPd in the foreground
#ENTRYPOINT ["vsftpd"]
ENTRYPOINT ["sh", "ftp.sh"]
