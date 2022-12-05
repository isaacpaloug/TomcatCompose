FROM tomcat:9.0-alpine
RUN mkdir /usr/local/tomcat/webapps-europa
RUN mkdir /usr/local/tomcat/webapps-africa
COPY server.xml /usr/local/tomcat/conf
COPY tomcat-users.xml /usr/local/tomcat/conf
COPY ./manager/context.xml /usr/local/tomcat/webapps/manager/META-INF
COPY ./host-manager/context.xml /usr/local/tomcat/webapps/host-manager/META-INF
RUN cp -r /usr/local/tomcat/webapps/manager /usr/local/tomcat/webapps-europa
RUN cp -r /usr/local/tomcat/webapps/manager /usr/local/tomcat/webapps-africa
RUN cp -r /usr/local/tomcat/webapps/host-manager /usr/local/tomcat/webapps-europa
RUN cp -r /usr/local/tomcat/webapps/host-manager /usr/local/tomcat/webapps-africa
COPY ./africa/index.html /usr/local/tomcat/webapps-africa
COPY ./europa/index.html /usr/local/tomcat/webapps-europa
RUN mkdir /var/log/tomcat
RUN touch /var/log/tomcat/europa_access_log.fecha.txt
RUN touch /var/log/tomcat/africa_access_log.fecha.txt