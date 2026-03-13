# Use the official PHP 8.2 Apache image
FROM php:8.2-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy the custom PHP configuration
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Set the working directory to the web root
WORKDIR /var/www/html

# Copy the application files to the container
COPY . /var/www/html/

# Ensure UPLOAD_FOLDER exists and is writable by the web server
RUN mkdir -p /var/www/html/UPLOAD_FOLDER && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html/UPLOAD_FOLDER

# Expose port 80
EXPOSE 80
