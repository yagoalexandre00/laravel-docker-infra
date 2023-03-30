FROM alpine:3.7 as alpine
RUN apk --no-cache add git bash
RUN addgroup -S user && adduser -S user -G user
RUN mkdir /opt
RUN mkdir /opt/biblioteca
RUN chown -R user:user /opt/biblioteca
USER user:user
RUN git clone https://github.com/goltaraya/biblioteca-dos-reis.git /opt/biblioteca

FROM composer:2.5.5
WORKDIR /opt/biblioteca
COPY --from=alpine /opt/biblioteca .
RUN composer install 
RUN composer update
COPY .env /opt/biblioteca/.env
RUN php artisan key:generate
