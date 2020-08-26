FROM ubuntu
USER root

# 必要なものをインストール
RUN apt-get update && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:jonathonf/python-3.6 && \
    apt-get update && \
    apt-get -y install nginx && \
    apt-get -y install python3.6-dev && \
    apt-get -y install python3-pip

# PythonのPATH設定
RUN ln -s /usr/bin/python3.6 /usr/bin/python
RUN rm -rf /usr/bin/python3 && ln -s /usr/bin/python3.6 /usr/bin/python3

# flask、uwsgiをインストール
RUN pip3 install --upgrade pip && pip install flask && pip install uwsgi

# アプリケーションをコピー
COPY app /var/app

# Nginxの設定ファイルをコピー
COPY default.conf /etc/nginx/conf.d/default.conf

# 起動
CMD ["/bin/bash", "/var/app/startup.sh"]