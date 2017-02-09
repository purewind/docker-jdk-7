FROM purewind/ubuntu:14.04.20170123 

MAINTAINER purewind "qingfengbaozai@gmail.com"  

# Add java dynamic memory script
COPY java-dynamic-memory-opts /srv/java/

# Install Oracle JDK 7u80
RUN cd /tmp \
    && wget -q 'http://mirrors.linuxeye.com/jdk/jdk-7u80-linux-x64.tar.gz' \
    && tar -xf jdk-7u80-linux-x64.tar.gz -C /srv/java \
    && rm -f jdk-7u80-linux-x64.tar.gz  \
    && ln -s /srv/java/jdk* /srv/java/jdk \
    && ln -s /srv/java/jdk /srv/java/jvm \
    && chown -R root:root /srv/java
    
ENV JAVA_HOME=/srv/java/jdk \
    PATH=${PATH}:/srv/java/jdk/bin:/srv/java
