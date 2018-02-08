#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM centos:centos7

# Install Nginx.

RUN yum -y install --setopt=tsflags=nodocs centos-release-scl-rh && \
    yum -y update --setopt=tsflags=nodocs && \
    yum -y install --setopt=tsflags=nodocs scl-utils && \
    yum -y install --setopt=tsflags=nodocs wget


RUN \
    yum clean all && \
    mkdir -p /usr/share/nginx/html && \
    mkdir -p /etc/nginx

COPY nginx.tar.gz /root/
COPY libluajit.tar.gz /root/
COPY install.sh /root/
COPY update.sh /root/
RUN /root/install.sh

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/etc/nginx/", "/var/log/", "/usr/share/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
