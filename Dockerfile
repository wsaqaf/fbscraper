FROM python:3.11

# 1. Install system dependencies for Apache, WSGI, and PHP
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-wsgi-py3 \
    php \
    libapache2-mod-php \
    php-cli \
    && rm -rf /var/lib/apt/lists/*

# 2. Permissions fix to prevent 403 Forbidden errors when using volumes
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# 3. Set working directory
WORKDIR /var/www/html

# 4. Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy application files
COPY . .
RUN chown -R www-data:www-data /var/www/html

# 6. Configure Apache for FBScraper
COPY fbscraper.conf /etc/apache2/sites-available/fbscraper.conf
RUN a2dissite 000-default.conf && \
    a2ensite fbscraper.conf && \
    a2enmod rewrite

# 7. PHP performance tuning for large HAR files
RUN for dir in $(find /etc/php -type d -name "conf.d"); do \
    echo "upload_max_filesize=128M" > "$dir/99-overrides.ini" && \
    echo "post_max_size=130M" >> "$dir/99-overrides.ini" && \
    echo "memory_limit=512M" >> "$dir/99-overrides.ini"; \
    done

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]