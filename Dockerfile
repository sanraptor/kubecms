FROM webdevops/php-nginx:8.0

ADD .docker/nginx.conf /opt/docker/etc/nginx/vhost.conf

WORKDIR /opt/drupal
ADD ./backend /opt/drupal

RUN set -eux; \
	composer install; \
	chown -R www-data:www-data web/sites web/modules web/themes; \
	rmdir /var/www/html; \
	ln -sf /opt/drupal/web /var/www/html;

ENV PATH=${PATH}:/opt/drupal/vendor/bin

# RUN composer install -d /var/www/html -n; \
#     chown -R www-data:www-data /var/www/html/web; \
#     chmod 755 /var/www/html/web/sites/default/files; \
#     cd /usr/sbin/ && ln -s /var/www/html/vendor/drush/drush/drush drush