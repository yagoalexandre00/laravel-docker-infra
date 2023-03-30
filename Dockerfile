FROM alpine:3.8 as alpine-stage01
RUN apk --no-cache add git
RUN addgroup -S user && adduser -S user -G user
RUN mkdir /opt
RUN mkdir /opt/biblioteca
RUN chown -R user:user /opt/biblioteca
USER user:user
RUN git clone https://github.com/goltaraya/biblioteca-dos-reis.git /opt/biblioteca
COPY package.json /opt/biblioteca/package.json

FROM bitnami/laravel:latest
WORKDIR /opt/biblioteca
COPY --from=alpine-stage01 /opt/biblioteca .
RUN composer install 
RUN composer update
COPY .env /opt/biblioteca/.env
RUN php artisan key:generate
RUN npm install
RUN npm run build
RUN  php artisan migrate