FROM php:8.3-cli

RUN apt-get update && apt-get install -y \
    libzip-dev \
    libicu-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxslt1-dev \
    libxml2-dev \
    zlib1g-dev \
    libpq-dev \
    libsqlite3-dev \
    libssl-dev \
    pkg-config \
    unzip \
    git \
    libmagickwand-dev \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    gd \
    intl \
    mbstring \
    opcache \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    sockets \
    simplexml \
    xsl \
    soap \
    dom \
    iconv \
    zip \
    && pecl install redis \
    && pecl install imagick \
    && pecl install xdebug \
    && docker-php-ext-enable redis imagick xdebug \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

