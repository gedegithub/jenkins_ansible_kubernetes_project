FROM almalinux:latest

LABEL maintainer="gedemarcel0002@hotmail.com"

# Install basic utilities: apache, zip, and unzip
RUN yum -y update && yum -y install httpd zip unzip && yum clean all

# Download zip file into root directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page287/photographer.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Unzip the downloaded file
RUN unzip photographer.zip

# Copy the contents of 'photogenic' dir to the current directory
RUN cp -rvf photographer/* .

# Remove the 'photogenic' directory and the zip file to clean up
RUN rm -rf photographer photographer.zip

# Default command at runtime
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP port
EXPOSE 80
