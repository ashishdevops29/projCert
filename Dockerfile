FROM devopsedu/webapp

RUN apt-get update -y

RUN apt-get install -y apache2

RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

RUN rm -rf /var/www/html/*

COPY ./website /var/www/html/

EXPOSE 8080

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD ["php", "-S", "0.0.0.0:80"]
