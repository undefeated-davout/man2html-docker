# man2html-docker

[![Push to Docker registry](https://github.com/undefeated-davout/man2html-docker/actions/workflows/build.yml/badge.svg)](https://github.com/undefeated-davout/man2html-docker/actions/workflows/build.yml)

## 起動

```bash
docker-compose up -d
```

```bash
# imageから直接起動
docker run -td --restart always -p 8050:80 --name man2html undefeateddavout/man2html-docker
```

## アクセス

<http://localhost:8050/cgi-bin/man/man2html>
