# Pull the latest nginx base image
FROM nginx:latest


# Developed and maintained by Nick Brabant at Julia Balfour LLC
MAINTAINER Nick Brabant <nick@juliabalfour.com>


# Set environment variables and working directory
ENV APP_PATH    /usr/share/nginx/html
ENV CONF_PATH   /etc/nginx/conf.d

WORKDIR $APP_PATH


# Install updates & dependencies
RUN apt-get update -qq && \
    apt-get install -y \
    php5 \
    php5-dev \
    php5-common \
    php5-cli \
    php5-fpm


# Copy configuration to image
COPY conf/ $CONF_PATH


# Map wp-content to working directory
ADD /wp-content .