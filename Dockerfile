FROM ubuntu:22.04

# Install Python3, Apache, and mod_wsgi
RUN apt-get update && \
    apt-get install -y \
            python3 \
            python3-pip \
            python3-venv \
            apache2 \
            libapache2-mod-wsgi-py3 && \
    apt-get clean

# Activate the mod_wsgi
RUN a2enmod wsgi

# Add the apache VirtualHost, to setup the WSGI module for the app
COPY apache-vhost.conf /etc/apache2/sites-enabled/000-default.conf

# Optional: Redirect error log to stdout, to make it visible in `docker compose up` output
RUN ln -sf /dev/stdout /var/log/apache2/error.log

# Install FastAPI and the WSGIMiddleware
RUN python3 -m venv /var/www/html/.venv && \
    /var/www/html/.venv/bin/python3 -m pip install fastapi a2wsgi

# Add the FastAPI application
COPY main.py /var/www/html/
RUN chown -R www-data:www-data /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
