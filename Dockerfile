FROM devopsedu/webapp
RUN apt-get update -y
RUN apt-get install -y apache2
RUN apt install -y php libapache2-mod-php php-mysql
RUN rm -rf /var/www/html/*
COPY ./website /var/www/html/
EXPOSE 8080
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

