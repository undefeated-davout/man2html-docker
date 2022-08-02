FROM debian:bookworm

RUN apt update && apt install -y \
    man2html \
    swish++ \
  && apt autoremove && apt autoclean

# ローカル以外からのアクセス許可設定
COPY ./conf/ ./conf/
COPY ./settings/favicon.ico /var/www/html/
RUN cp ./conf/man2html.conf /etc/apache2/conf-available/man2html.conf

# CGI有効
RUN a2enmod cgid

# man表示用のインストール
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
  aircrack-ng \
  curl \
  dnsutils \
  dsniff \
  git \
  gobuster \
  hashcat \
  htop \
  hydra \
  iproute2 \
  iputils-ping \
  john \
  jq \
  net-tools \
  netcat-openbsd \
  nmap \
  sqlmap \
  tar \
  tcpdump \
  tmux \
  traceroute \
  tree \
  tshark \
  unar \
  unzip \
  wget \
  whois \
  zip \
  && apt autoremove && apt autoclean

CMD ["/bin/bash", "-c", "service apache2 start && tail -F /var/log/apache2/*"]
