# Use frovlad/alpine-glibc image (glibc is needed)
FROM frolvlad/alpine-glibc

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY hdsentinel.sh  /app

# Install any needed packages and do needed file system modifcations
RUN apk add --no-cache wget \
	&& wget https://www.hdsentinel.com/hdslin/hdsentinel-020b-x64.zip \
	&& unzip hdsentinel-020b-x64.zip \
	&& apk del wget \
	&& chmod 0755 HDSentinel \
	&& mkdir /etc/hdsentinel\
    	&& mv HDSentinel /bin/hdsentinel \
	&& chmod +x hdsentinel.sh \
	&& echo "*/10       *       *       *       *       hdsentinel -r /etc/hdsentinel/hdsreport.html -html" >> /var/spool/cron/crontabs/root

# Define environment variable
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG C.UTF-8

# Run  when the container launches 
ENTRYPOINT ["./hdsentinel.sh"]
