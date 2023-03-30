FROM alpine:3.8 as alpine-stage01
RUN apk --no-cache add git bash nodejs npm
RUN addgroup -S user && adduser -S user -G user
RUN mkdir /opt
RUN mkdir /opt/biblioteca
RUN chown -R user:user /opt/biblioteca
USER user:user
RUN git clone https://github.com/goltaraya/biblioteca-dos-reis.git /opt/biblioteca

FROM composer:2.5.5 as composer-stage01
WORKDIR /opt/biblioteca
COPY --from=alpine-stage01 /opt/biblioteca .
RUN composer install 
RUN composer update
COPY .env /opt/biblioteca/.env
RUN php artisan key:generate

FROM alpine-stage01 as alpine-stage02
WORKDIR /opt/biblioteca
RUN npm install
RUN npm run build 

