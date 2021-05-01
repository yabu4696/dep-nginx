FROM nginx:1.18.0

RUN rm /etc/nginx/conf.d/default.conf

RUN yum install lua-devel git libxslt-devel libcurl-devel httpd-devel libxml2-devel openssl-devel zlib-devel GeoIP-devel gcc perl-ExtUtils-Embed pcre-devel
RUN git clone https://github.com/simpl/ngx_devel_kit.git
RUN git clone https://github.com/openresty/lua-nginx-module.git
RUN ./configure --add-module=../ngx_devel_kit --add-module=../lua-nginx
RUN make && make install

COPY nginx.conf /etc/nginx/conf.d
COPY healthcheck.html /var/www/index/
COPY home_sitemap.xml /var/www/index/
COPY camera_sitemap.xml /var/www/index/
COPY lens_sitemap.xml /var/www/index/