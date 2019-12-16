FROM centos:7
LABEL maintainer="sandeepsharon@gmail.com"
RUN yum -y update 
RUN useradd -ms /bin/bash elastic
#RUN groupadd -r elastic && useradd -m -g elastic elastic
COPY elasticsearch-5.5.0 /elasticsearch-5.5.0
COPY script.sh /script.sh
RUN ./script.sh
RUN rm -rf /home/elastic/config/elasticsearch.yml
COPY elasticsearch.yml /home/elastic/config/elasticsearch.yml
RUN chown -R elastic:elastic /home/elastic/ && chmod -R 744 /home/elastic/
USER elastic
WORKDIR /home/elastic
EXPOSE 9200
EXPOSE 9300
#CMD ["/opt/tomcat/bin/startup.sh"]
CMD ["./bin/elasticsearch"]

