FROM orivil/nginx:latest

RUN mkdir -p /www/html
COPY html-update-server /www
COPY start.sh /www
COPY update-html.sh /www
COPY nginx.conf /etc/nginx/nginx.conf
ENV PATH="/www:${PATH}"
RUN cd /www/html && \
    git init && \
    git remote add origin "https://gitee.com/orivil/host-service.git" && \
    git pull origin master
RUN chmod +x /www/update-html.sh
RUN chmod +x /www/start.sh
RUN chmod +x /www/html-update-server
WORKDIR /www/
EXPOSE 8080
ENTRYPOINT ["start.sh"]