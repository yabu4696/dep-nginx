FROM nginx:1.18.0

RUN rm /etc/nginx/conf.d/default.conf
COPY ./static /usr/src/app/static/
COPY nginx.conf /etc/nginx/conf.d
COPY healthcheck.html /var/www/index/
COPY home_sitemap.xml /var/www/index/
COPY camera_sitemap.xml /var/www/index/
COPY lens_sitemap.xml /var/www/index/