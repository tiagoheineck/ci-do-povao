FROM nginx

ARG DOMAIN_NAME "cidopovao.com.br"


RUN openssl req -x509 -newkey rsa:4096 -nodes -out localhost.crt -keyout localhost.key -days 365 -subj "/C=BR/O=povao/OU=Domain Control Validated/CN=*.${DOMAIN_NAME}"

RUN cp localhost.crt /etc/ssl/certs/localhost.crt

RUN cp localhost.key /etc/ssl/private/localhost.key