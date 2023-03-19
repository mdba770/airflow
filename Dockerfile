FROM apache/airflow:2.5.1
USER root
RUN apt-get update && apt-get install git  libsasl2-dev \
    python3-distutils \
    build-essential \
    nano vim \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libsqlite3-dev \
    libreadline-dev \
    libbz2-dev \
    liblzma-dev \
    libffi-dev curl wkhtmltopdf -y
# REMOVE PYTHON
RUN rm -rf /usr/bin/python3.9
#PYTHON INSTALL 3.8.10
RUN curl -O https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tar.xz
RUN tar -xvf Python-3.8.10.tar.xz && cd Python-3.8.10 && ./configure --enable-optimizations && make -j6 && make altinstall
#PYTHON INSTALL 3.9.13
RUN curl -O https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tar.xz
RUN tar -xvf Python-3.9.13.tar.xz && cd Python-3.9.13 && ./configure --enable-optimizations && make -j6 && make altinstall
#PYTHON INSTALL 3.11.2
RUN curl -O https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tar.xz
RUN tar -xvf Python-3.11.2.tar.xz && cd Python-3.11.2 && ./configure --enable-optimizations && make -j6 && make altinstall
RUN rm -rf /opt/airflow/Python-3.*
