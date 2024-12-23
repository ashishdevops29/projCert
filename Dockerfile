FROM devopsedu/webapp
COPY ./website /var/www/html
RUN docker-php-ext-install mysqli
EXPOSE 80
CMD ["apache2-foreground"]
