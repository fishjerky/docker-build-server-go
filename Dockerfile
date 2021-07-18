FROM centos:7

#############################
# Go
# required command
RUN yum install -y tar zip unzip git gcc  wget
# gcc is for oracle
RUN yum install -y gcc 


ENV GO_VERSION 1.16.5
RUN wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && rm go${GO_VERSION}.linux-amd64.tar.gz 
RUN mkdir -p /go/bin /go/pkg /go/src
ENV GOPATH /go
RUN echo "export PATH=\"/usr/local/go/bin:/go/bin:$PATH\"" >> /root/.bashrc
ENV PATH="usr/local/go/bin:/go/bin:${PATH}"
RUN go env -w GO111MODULE=off



######
RUN rpm -ivh https://download.oracle.com/otn_software/linux/instantclient/211000/oracle-instantclient-basic-21.1.0.0.0-1.x86_64.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/libaio-0.3.109-13.el7.x86_64.rpm

#CMD ["go", "version"]
CMD ["/bin/bash"]
