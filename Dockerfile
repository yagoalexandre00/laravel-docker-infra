FROM alpine:3.7
RUN apk --no-cache add git bash
RUN addgroup -S user && adduser -S user -G user
RUN mkdir /opt
RUN mkdir /opt/biblioteca
RUN chown -R user:user /opt/biblioteca
USER user:user
RUN git clone https://github.com/goltaraya/biblioteca-dos-reis.git /opt/biblioteca