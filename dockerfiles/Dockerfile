FROM centos/python-36-centos7:latest
USER root

COPY requirements.txt /code/
COPY reader/ /code
COPY dockerfiles/entrypoint.sh /entrypoint.sh

RUN yum update -y && \
    yum install nc -y && \
    yum install gcc-c++ -y && \
    yum install mariadb-devel.x86_64 -y && \
    chmod a+x /entrypoint.sh && \
    pip install --no-cache-dir -r /code/requirements.txt


CMD /entrypoint.sh
