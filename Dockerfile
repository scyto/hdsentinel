# Use frovlad/alpine-glibc image (glibc is needed)
FROM frolvlad/alpine-glibc

# Copy the current directory contents into the container at /app
COPY hdsentinel.sh .
RUN chmod +x hdsentinel.sh

# Install any needed packages specified in requirements.txt
RUN apk add wget
RUN mkdir /etc/hdsentinel
RUN wget https://www.hdsentinel.com/hdslin/hdsentinel-017-x64.gz 
RUN gunzip hdsentinel-017-x64.gz
RUN chmod 0755 hdsentinel-017-x64
RUN mv hdsentinel-017-x64 /bin/hdsentinel
RUN echo "*/10       *       *       *       *       hdsentinel -r /etc/hdsentinel/hdsreport.html -html" >> /var/spool/cron/crontabs/root


# Define environment variable
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG C.UTF-8

# Run  when the container launches 
ENTRYPOINT ["./hdsentinel.sh"]