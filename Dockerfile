FROM devopsedu/webapp
COPY ./website /var/www/html
EXPOSE 80
CMD ["php", "-S", "0.0.0.0:80"]
