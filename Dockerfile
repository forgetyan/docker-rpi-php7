FROM forgetyan/rpi-nginx
MAINTAINER Yannick Forget
RUN apt-get update && apt-get install -t stretch php7.0 php7.0-curl php7.0-gd php7.0-fpm php7.0-cli php7.0-opcache php7.0-mbstring php7.0-xml php7.0-zip
RUN rm /etc/nginx/sites-enabled/default
ADD sites-enabled/default /etc/nginx/sites-enabled/default
ADD start.sh /start.sh
RUN chmod 755 /start.sh && /etc/init.d/nginx reload && service php7.0-fpm start
CMD ["/start.sh"]
