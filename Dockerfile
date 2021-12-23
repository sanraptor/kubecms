FROM webdevops/php-nginx:8.0

ADD .docker/nginx.conf /opt/docker/etc/nginx/vhost.conf
ADD ./backend /var/www/html

# RUN composer install -d /var/www/html -n; \
#     chown -R www-data:www-data /var/www/html/web; \
#     chmod 755 sites/default/files; \
#     cd /usr/sbin/ && ln -s /var/www/html/vendor/drush/drush/drush drush