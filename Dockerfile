FROM 914684874285.dkr.ecr.ap-southeast-1.amazonaws.com/dubicars_app:latest

# # Copy composer.lock and composer.json file to /var/www
# COPY composer.lock composer.json /var/www/

# # Set working direcotry
# WORKDIR /var/www

# # Install dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libpng-dev \
#     libjpeg62-turbo-dev \
#     libfreetype6-dev \
#     locales \
#     zip \
#     jpegoptim optipng pngquant gifsicle \
#     vim \
#     unzip \
#     git \
#     curl \
#     libonig-dev \
#     libzip-dev \
#     libgd-dev

# # Clear cache
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # Install extensions
# RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
# RUN docker-php-ext-configure gd --with-external-gd
# RUN docker-php-ext-install gd

# Copy existing application directory contents
COPY . /var/www

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Add user for laravel application
# RUN groupadd -g 1000 www
# RUN useradd -u 1000 -ms /bin/bash -g www root

# Set permissions for larvel logs
RUN chmod -R 777 /var/www/storage/

# Change current user to www
USER root

# Expose port 9000 and start server
EXPOSE 9000
CMD ["php-fpm"]

