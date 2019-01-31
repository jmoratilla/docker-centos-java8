FROM centos:7.6.1810
MAINTAINER Jorge Moratilla <jorge@moratilla.com>

RUN rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y install postgresql10 && \
    curl --silent --location --retry 3 \
    -o jre-8u202-linux-x64.rpm \
    --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    "https://download.oracle.com/otn-pub/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/jre-8u202-linux-x64.rpm" && \
    yum localinstall -y jre-8u202-linux-x64.rpm && \
    yum clean all && \
    rm jre-8u202-linux-x64.rpm
# Define working directory.

WORKDIR /data

# Define commonly used JAVA_HOME variable

ENV JAVA_HOME /usr/java/jre1.8.0_202-amd64 \
    LANG C.UTF-8

CMD ["bash"]
