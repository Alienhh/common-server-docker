FROM redis:4.0.9
RUN mkdir -p /usr/redis/config \
    && chmod -R 777 /usr/redis/config
COPY ./config/redis.conf /usr/redis/config/
CMD [ "sh","-c","redis-server /usr/redis/config/redis.conf" ]