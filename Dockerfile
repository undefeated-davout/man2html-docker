FROM debian:bookworm-slim

# manインストール
RUN sed -i '/path-exclude \/usr\/share\/man/d' /etc/dpkg/dpkg.cfg.d/docker
RUN sed -i '/path-exclude \/usr\/share\/groff/d' /etc/dpkg/dpkg.cfg.d/docker
RUN apt update &&\
  apt install --reinstall coreutils &&\
  apt install -y\
    man \
    man2html \
  && apt autoremove && apt autoclean

# ローカル以外からのアクセス許可設定
ADD ./conf/ ./conf/
RUN cp ./conf/man2html.conf /etc/apache2/conf-available/man2html.conf

# CGI有効
RUN a2enmod cgid

# man表示用のインストール
RUN apt install -y\
  netcat-openbsd \
  nmap \
  && apt autoremove && apt autoclean

CMD ["/bin/bash", "-c", "service apache2 start && tail -F /var/log/apache2/*"]
