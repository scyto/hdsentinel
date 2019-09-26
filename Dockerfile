# Use frovlad/alpine-glibc image (glibc is needed)
FROM frolvlad/alpine-glibc

# Copy the current directory contents into the container at /app
COPY hdsentinel.sh .

# Install any needed packages specified in requirements.txt
RUN apk add wget \
	&& wget https://www.hdsentinel.com/hdslin/hdsentinel-017-x64.gz \
	&& gunzip hdsentinel-017-x64.gz

# File system modifications
RUN chmod 0755 hdsentinel-017-x64 \
	&& mkdir /etc/hdsentinel\
	&& chmod +x hdsentinel.sh \
    && mv hdsentinel-017-x64 /bin/hdsentinel \
	&& echo "*/10       *       *       *       *       hdsentinel -r /etc/hdsentinel/hdsreport.html -html" >> /var/spool/cron/crontabs/root

# Define environment variable
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG C.UTF-8

# Run  when the container launches 
ENTRYPOINT ["./hdsentinel.sh"]