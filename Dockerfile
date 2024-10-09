# Version 1.1.0

FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
