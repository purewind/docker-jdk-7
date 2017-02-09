FROM purewind/ubuntu:14.04.20170123 

MAINTAINER purewind "qingfengbaozai@gmail.com"  

LABEL Description="Java + Ubuntu (OpenJDK)"

ARG JAVA_VERSION=7u80

ENV JAVA_HOME=/usr/java/jdk

WORKDIR /

# Install Oracle JDK 7u80
RUN wget -q "http://mirrors.linuxeye.com/jdk/jdk-$JAVA_VERSION-linux-x64.tar.gz" && \
    mkdir /usr/java && \
    tar -xf "jdk-$JAVA_VERSION-linux-x64.tar.gz" -C /usr/java && \
    rm -f 'jdk-$JAVA_VERSION-linux-x64.tar.gz'  && \
    ln -s /usr/java/jdk* /usr/java/jdk && \
    ln -s /usr/java/jdk /usr/java/jvm && \
    chown -R root:root /usr/java

COPY profile.d/java.sh /etc/profile.d/

COPY java-dynamic-memory-opts /usr/java/jdk

CMD /bin/bash