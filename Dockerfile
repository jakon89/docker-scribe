# DOCKER-VERSION  1.12.0
# AUTHOR:         Santiago del Castillo
# DESCRIPTION:    Image with Scribe
# TO_BUILD:       docker build -rm -t scribe .
# TO_RUN:         docker run -it -d -p 1463:1463 scribe bin/bash


FROM ubuntu:12.04

MAINTAINER ADAM JEDRO

RUN apt-get update; \
     apt-get -y install make libboost-all-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev git-core

RUN git clone -b 0.9.1 https://github.com/apache/thrift.git

RUN cd /thrift && ./bootstrap.sh && ./configure --with-java=no --with-erlang=no --with-php=no --with-perl=no --with-php_extension=no --with-ruby=no --with-haskell=no --with-go=no && make && make install

RUN cd /thrift/contrib/fb303 && ./bootstrap.sh && ./configure --without-java --without-php && make && make install && cd py && python setup.py install && make distclean

RUN git clone https://github.com/jakon89/scribe.git

RUN cd /scribe && ./bootstrap.sh && ./configure CPPFLAGS="-DHAVE_INTTYPES_H -DHAVE_NETINET_IN_H -DBOOST_FILESYSTEM_VERSION=2" LIBS="-lboost_system -lboost_filesystem" && make && make install && cd lib/py && python setup.py install && make distclean

RUN mkdir /var/lib/scribe/

ADD config/scribe.conf /etc/

EXPOSE 1463

RUN ldconfig

CMD ["/usr/local/bin/scribed", "-c", "/etc/scribe.conf"]
