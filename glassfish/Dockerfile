FROM glassfish/server

ENV GLASSFISH_HOME=/glassfish4/glassfish/

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz \
   && tar -xzvf mysql-connector-java-5.1.40.tar.gz \
   && cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar $GLASSFISH_HOME/lib/

ADD jackson/* $GLASSFISH_HOME/module/
