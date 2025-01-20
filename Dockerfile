FROM php:8.2-apache

# Enable required Apache modules
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod expires

# Set working directory
WORKDIR /var/www/html

# Copy Apache configuration
COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Set proper permissions for all files and directories
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html