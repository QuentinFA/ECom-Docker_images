# GlassFish on Docker
FROM glassfish/openjdk

# Maintainer
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Set environment variables and default password for user 'admin'
ENV GLASSFISH_PKG=glassfish-4.1.zip \
    GLASSFISH_URL=http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip \
    GLASSFISH_HOME=/glassfish4 \
    PATH=$PATH:/glassfish4/bin \
    PASSWORD=glassfish

# Install packages, download and extract GlassFish
# Setup password file
# Enable DAS
    RUN apk add --update wget unzip && \
    wget --no-check-certificate $GLASSFISH_URL && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG && \
    echo "--- Setup the password file ---" && \
    echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd && \
    echo "AS_ADMIN_NEWPASSWORD=${PASSWORD}" >> /tmp/glassfishpwd  && \
    echo "--- Enable DAS, change admin password, and secure admin access ---" && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1 && \
    asadmin start-domain && \
    echo "AS_ADMIN_PASSWORD=${PASSWORD}" > /tmp/glassfishpwd && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin && \
    asadmin --user=admin stop-domain && \
    rm /tmp/glassfishpwd && \
    wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.tar.gz \
    && tar -xzvf mysql-connector-java-5.1.40.tar.gz \
    && cp mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar $GLASSFISH_HOME/glassfish/lib/ && \
    apk del wget unzip
    
    ADD jackson/* $GLASSFISH_HOME/glassfish/module/
    # Ports being exposed
    EXPOSE 4848 8080 8181

    # Start asadmin console and the domain
    CMD ["asadmin", "start-domain", "-v"]

