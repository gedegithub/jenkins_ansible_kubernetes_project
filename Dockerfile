FROM almalinux:latest

LABEL maintainer="gedemarcel0002@hotmail.com"

# Install basic utilities: apache, zip, and unzip
RUN yum -y update && yum -y install httpd && yum clean all

# Copy the contents of 'iPortfolio' directly to the web root
COPY iPortfolio/ /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Ensure proper permissions for Apache
RUN chown -R apache:apache /var/www/html && \
    chmod -R 755 /var/www/html

# Default command at runtime
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP port
EXPOSE 80