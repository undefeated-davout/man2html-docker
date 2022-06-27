FROM debian:bookworm

RUN apt update &&\
  apt install -y\
    man2html \
  && apt autoremove && apt autoclean

# ローカル以外からのアクセス許可設定
ADD ./conf/ ./conf/
RUN cp ./conf/man2html.conf /etc/apache2/conf-available/man2html.conf

# CGI有効
RUN a2enmod cgid

# man表示用のインストール
RUN apt install -y\
  curl \
  git \
  john \
  netcat-openbsd \
  nmap \
  tar \
  unzip \
  wget \
  && apt autoremove && apt autoclean

CMD ["/bin/bash", "-c", "service apache2 start && tail -F /var/log/apache2/*"]
