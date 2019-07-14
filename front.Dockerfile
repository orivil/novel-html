FROM orivil/nginx:latest

RUN mkdir -p /www/html
COPY ./ /www
RUN mv -f /www/front-nginx.conf /etc/nginx/nginx.conf
ENV PATH="/www:${PATH}"
RUN cd /www/html && \
    git init && \
    git remote add origin "https://gitee.com/sue_net/novel-front-html.git" && \
    git pull origin master
RUN chmod +x /www/update-html.sh
RUN chmod +x /www/start.sh
RUN chmod +x /www/html-update-server
WORKDIR /www/
EXPOSE 9091
ENTRYPOINT ["start.sh"]