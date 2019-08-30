FROM orivil/nginx:latest

RUN mkdir -p /www/html
COPY ./ /www
RUN mv -f /www/psy-testing-end-nginx.conf /etc/nginx/nginx.conf
ENV PATH="/www:${PATH}"
RUN cd /www/html && \
    git init && \
    git remote add origin "https://gitee.com/sue_net/psy-end.git" && \
    git pull origin master
RUN chmod +x /www/update-html.sh
RUN chmod +x /www/start.sh
RUN chmod +x /www/html-update-server
WORKDIR /www/
EXPOSE 9095
ENV http_port=":7075"
ENTRYPOINT ["start.sh"]