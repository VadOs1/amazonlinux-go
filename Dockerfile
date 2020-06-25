FROM amazonlinux:1
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin:$GOROOT/bin
ENV PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig
COPY vips-8.9.2.tar.gz vips-8.9.2.tar.gz
RUN yum -y update \
    && yum install -y gcc-c++ make \
    && curl -sL https://rpm.nodesource.com/setup_12.x | bash - \
    && yum install -y nodejs \
    && npm install -g serverless \
    && yum install -y wget \
    && yum install -y git \
    && wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz \
    && tar -xvf go1.14.linux-amd64.tar.gz \
    && mv go /usr/local \
    && go get github.com/golang/dep/cmd/dep \
    && yum install -y glib2-devel \
    && yum install -y gtk-doc \
    && yum install -y expat-devel \
    && tar xf vips-8.9.2.tar.gz \
    && cd vips-8.9.2 \
    && ./configure \
    && make \
    && make install \
    && ldconfig